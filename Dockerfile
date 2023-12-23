# # Build Stage
# FROM node:16 AS build
# WORKDIR /app

# COPY . .
# WORKDIR /app/assets
# RUN yarn install && yarn deploy

# # Production Stage
# FROM elixir:latest

# RUN mix local.hex --force && \
#     mix local.rebar --force

# WORKDIR /app

# COPY config/prod.secret.exs config/prod.secret.exs
# COPY mix.exs mix.lock ./
# COPY config config

# COPY --from=build /app/priv/static priv/static

# RUN mix do deps.get, deps.compile

# COPY lib lib
# COPY priv priv

# EXPOSE 8080

# CMD ["mix", "phx.server"]
# Build Stage for Assets
FROM node:16 AS assets_build
WORKDIR /app

COPY . .
WORKDIR /app/assets
RUN yarn install && yarn deploy

# Elixir dependencies and compilation
FROM elixir:1.7 AS elixir_build

RUN mix local.hex --force && \
    mix local.rebar --force

WORKDIR /app

COPY config/prod.secret.exs config/prod.secret.exs
COPY mix.exs mix.lock ./
COPY config config

COPY --from=assets_build /app/priv/static priv/static

RUN mix do deps.get, deps.compile

# Application release
FROM elixir:latest AS release

WORKDIR /app

COPY --from=elixir_build /app .

# Install Hex and Rebar
RUN mix local.hex --force && \
    mix local.rebar --force

# Ensure that dependencies are fetched
RUN mix deps.get

# Compile the Elixir application and create the release
RUN mix release

# Final minimal image for production
FROM elixir:latest

WORKDIR /app

# Copy only the necessary release artifacts
COPY --from=build /app/priv/static priv/static

EXPOSE 8080

CMD ["mix", "phx.server"]
