FROM plangora/alpine-elixir-phoenix:otp-23.0.2-elixir-1.10.3 as phx-builder

ENV PORT=4000 MIX_ENV=prod

ADD . .

# Run frontend build, compile, and digest assets, and set default to own the directory
RUN mix deps.get && cd assets/ && \
		npm install && \
    npm run deploy && \
    cd - && \
    mix do compile, phx.digest, release

FROM bitwalker/alpine-erlang:23.0.2

EXPOSE 4000
ENV PORT=4000 MIX_ENV=prod

COPY --from=phx-builder /opt/app/_build/prod/rel/phoenix_deploy/ /opt/app/
RUN chown -R default /opt/app/

USER default

CMD ["/opt/app/bin/eldeploy", "foreground"]