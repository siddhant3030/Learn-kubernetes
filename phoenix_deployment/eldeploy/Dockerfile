FROM elixir:1.10-alpine as builder

COPY . .

RUN mix local.rebar --force && \
    mix local.hex --if-missing --force && \
    mix do deps.get --only $MIX_ENV, deps.compile, phx.digest

RUN mix release \
    && rm -rf /app/deps


