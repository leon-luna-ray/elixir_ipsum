# Build Stage
FROM node:16 AS build
WORKDIR /app

COPY . .
WORKDIR /app/assets
RUN yarn install && yarn deploy

# Production Stage
FROM elixir:latest

RUN mix local.hex --force && \
    mix local.rebar --force

WORKDIR /app

COPY config/prod.secret.exs config/prod.secret.exs
COPY mix.exs mix.lock ./
COPY config config

COPY --from=build /app/priv/static priv/static

RUN mix do deps.get, deps.compile

COPY lib lib
COPY priv priv

EXPOSE $PORT

CMD ["mix", "phx.server"]
