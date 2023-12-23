import Config

config :elixir_ipsum, ElixirIpsumWeb.Endpoint,
  url: [host: "elixir-ipsum.fly.dev", port: 8080],
  cache_static_manifest: "priv/static/cache_manifest.json"

config :logger, level: :info

import_config "prod.secret.exs"
