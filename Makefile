COMMIT := $(shell git describe --always --dirty)
IS_DB_RUNNING := $(shell docker inspect -f '{{ .State.Running }}' langa_db 2>/dev/null)
IS_SERVICE_RUNNING := $(shell docker inspect -f '{{ .State.Running }}' langa_service 2>/dev/null)

MIX_ENV ?= prod

.PHONY: default run mix-build mix-start start stop clean
default: run

run: postgres
	./bin/run.sh

mix-build:
	MIX_ENV=$(MIX_ENV) mix deps.get
	MIX_ENV=$(MIX_ENV) mix compile
	MIX_ENV=$(MIX_ENV) mix release --overwrite

mix-start: mix-build
	_build/$(MIX_ENV)/rel/langasql/bin/langasql start

start-test: postgres langasql-populate langasql
start: postgres langasql

stop: langasql-stop postgres-stop

clean: docker-network-clean

.PHONY: postgres langasql
postgres: postgres-run-$(COMMIT)

langasql: langasql-run-$(COMMIT)


.PHONY: postgres-build-$(COMMIT) postgres-run-$(COMMIT) postgres-connect postgres-stop
postgres-build-$(COMMIT):
ifeq (,$(shell docker images -q langa-db:$(COMMIT)))
	@docker build -f Dockerfile.sql -t "langa-db:$(COMMIT)" .
else
	$(NOOP)
endif

postgres-run-$(COMMIT): postgres-build-$(COMMIT) docker-network
ifndef IS_DB_RUNNING
	@docker run \
	--net langasql-network \
	-p 5432:5432/tcp \
	--rm -d --name langa_db \
	"langa-db:$(COMMIT)"
else
	$(NOOP)
endif

postgres-connect:
ifdef IS_DB_RUNNING
	@docker exec -it langa_db psql -U postgres -d langasql_dev
else
	$(NOOP)
endif

postgres-stop:
ifdef IS_DB_RUNNING
	@docker kill langa_db
else
	$(NOOP)
endif


.PHONY: langasql-build-$(COMMIT) langasql-run-$(COMMIT) langasql-stop
langasql-build-$(COMMIT):
	@docker build -t "langa-service:$(COMMIT)" .

langasql-run-$(COMMIT): langasql-build-$(COMMIT) docker-network
ifndef IS_SERVICE_RUNNING
	@docker run --rm \
	--name langa_service \
	--net langasql-network \
	-e DATABASE_URL="postgress://postgres:postgres@langa_db:5432/langasql_dev" \
	-e SECRET_KEY_BASE="o5S/Xl5lCgnZKzFqj8DLhEGrFWveD9hRaLB1BEh77ke+LjWjgObjU+cXz/wQEYNm" \
	-e PORT=4000 \
	-p 4000:4000 \
	"langa-service:$(COMMIT)"
else
	$(NOOP)
endif

langasql-stop:
ifdef IS_SERVICE_RUNNING
	@docker kill langa_service
else
	$(NOOP)
endif

langasql-populate:
	@docker build -f Dockerfile.populate -t "langa-populate:latest" .
	@docker run --rm \
	--name langa_populate \
	--net langasql-network \
	-e DB_USERNAME="postgres" \
	-e DB_PASSWORD="postgres" \
	-e DB_DATABASE="langasql_dev" \
	-e DB_HOSTNAME="langa_db" \
	-e DATABASE_URL="postgress://postgres:postgres@langa_db:5432/langasql_dev" \
	-e SECRET_KEY_BASE="o5S/Xl5lCgnZKzFqj8DLhEGrFWveD9hRaLB1BEh77ke+LjWjgObjU+cXz/wQEYNm" \
	"langa-populate:latest"

.PHONY: docker-network docker-network-clean
docker-network:
ifeq (,$(shell docker network ls -q --filter name=langasql-network))
	@docker network create langasql-network
else
	$(NOOP)
endif

docker-network-clean: langasql-stop postgres-stop
	@docker network rm langasql-network
