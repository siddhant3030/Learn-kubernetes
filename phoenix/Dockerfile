#########################
# Stage: assets-builder #
#########################
FROM node:10-alpine as asset-builder

WORKDIR /app/assets
COPY assets/ .

RUN npm install \
    && npm run-script build

#########################
# Stage: builder        #
#########################
FROM elixir:1.10-alpine as builder

ENV MIX_HOME=/opt/mix \
    HEX_HOME=/opt/hex \
    MIX_ENV=prod

WORKDIR /app

COPY . .

COPY --from=asset-builder /app/priv/static/ /app/priv/static/

RUN mix local.rebar --force && \
    mix local.hex --if-missing --force && \
    mix do deps.get --only $MIX_ENV, deps.compile, phx.digest

RUN mix release \
    && rm -rf /app/deps

#########################
# Stage: production     #
#########################
FROM alpine:3.11 as production

RUN apk add --no-cache \
      bash \
      openssl \
      curl

WORKDIR /app

COPY --from=builder /app/_build/prod/rel/phx_cluster ./
COPY rel/bin /app/bin

RUN chown -R nobody: /app
USER nobody
ENV HOME=/app


ENTRYPOINT ["/app/bin/entrypoint.sh"]
CMD ["bin/phx_cluster", "start"]
