FROM elixir:1.10.2

RUN mkdir /app
COPY . /app

WORKDIR /app

RUN mix local.hex --force

ENTRYPOINT ./bin/run.sh
