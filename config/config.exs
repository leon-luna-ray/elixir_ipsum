# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
import Config

config :elixir_ipsum,
  ecto_repos: [ElixirIpsum.Repo]

# Configures the endpoint
config :elixir_ipsum, ElixirIpsumWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "Ur3dCdHFck+BjAIeyJFEJwIToaa/8YQB7oghXzpAcjnMYSBzvCOcaOp5W0fVFEAl",
  render_errors: [view: ElixirIpsumWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: ElixirIpsum.PubSub,
  live_view: [signing_salt: "6S7PMVOY"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
