COMMIT := $(shell git describe --always --dirty)
IS_RUNNING := $(shell docker inspect -f '{{ .State.Running }}' langa_test 2>/dev/null)

run: postgres
	./bin/run.sh

postgres: postgres-run-$(COMMIT)

postgres-stop:
ifdef IS_RUNNING
	@docker kill langa_test
else
	$(NOOP)
endif

.PHONY: postgres-build-$(COMMIT) postgres-run-$(COMMIT) postgres-connect
postgres-build-$(COMMIT):
ifeq (,$(shell docker images -q langa:$(COMMIT)))
	@docker build -f Dockerfile.sql -t "langa:$(COMMIT)" .
else
	$(NOOP)
endif

postgres-run-$(COMMIT): postgres-build-$(COMMIT)
ifndef IS_RUNNING
	@docker run -p 5432:5432/tcp --rm --name langa_test -d "langa:$(COMMIT)"
else
	$(NOOP)
endif

postgres-connect:
ifdef IS_RUNNING
	@docker exec -it langa_test psql -U postgres -d langasql_dev
else
	$(NOOP)
endif
