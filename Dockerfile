FROM elixir:alpine

RUN apk add --update --no-cache curl py-pip
RUN apk add --no-cache build-base git

WORKDIR /app

RUN mix local.hex --force && \
		mix local.rebar --force

COPY mix.exs mix.lock ./
COPY config config

RUN mix do deps.get, deps.compile

COPY priv priv
COPY lib lib

COPY . .

COPY ./.docker/docker-entrypoint.sh docker-entrypoint.sh

RUN mix deps.compile --force bcrypt_elixir

EXPOSE 4000
