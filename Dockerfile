# Use the official Elixir image as the base image
FROM elixir:latest

# Install hex and rebar
RUN mix local.hex --force && \
    mix local.rebar --force

# Set the working directory in the container
WORKDIR /app

# Copy prod.secret.exs.template and install dependencies
COPY config/prod.secret.exs config/prod.secret.exs
COPY mix.exs mix.lock ./
COPY config config
RUN mix do deps.get, deps.compile

# Copy frontend assets
COPY assets assets

# Change to the assets directory
WORKDIR /app/assets

# Build frontend assets using Yarn
RUN yarn install --frozen-lockfile
RUN yarn deploy

# Change back to the app directory
WORKDIR /app

# Copy the rest of the application
COPY lib lib
COPY priv priv

# Expose the Phoenix port
EXPOSE 8080

# Command to run the application
CMD ["mix", "phx.server"]
