FROM elixir:1.10.2-alpine AS build

ARG DB_HOSTNAME=localhost
ENV DB_HOSTNAME=${DB_HOSTNAME}

ARG MIX_ENV=prod
ENV MIX_ENV=${MIX_ENV}

# install hex + rebar
RUN mix local.hex --force && \
    mix local.rebar --force

WORKDIR /app

COPY lib lib
COPY config config

COPY mix.exs ./
COPY mix.lock ./

RUN mix deps.get && \
    mix compile && \
    mix release


FROM alpine:3.11.6 AS app

ARG MIX_ENV=prod
ENV MIX_ENV=${MIX_ENV}
ENV HOME=/app
ENV APP_NAME=langasql

RUN apk add --no-cache openssl ncurses-libs

WORKDIR /app

RUN chown nobody:nobody /app
USER nobody:nobody

COPY --from=build --chown=nobody:nobody /app/_build/${MIX_ENV}/rel/${APP_NAME} ./

CMD ["bin/langasql", "start"]

