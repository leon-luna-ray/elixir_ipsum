import Config

config :elixir_ipsum, ElixirIpsumWeb.Endpoint,
  url: [host: "elixir-ipsum.fly.dev", port: 8080],
  cache_static_manifest: "priv/static/cache_manifest.json"

config :argon2_elixir, t_cost: 2, m_cost: 15 # ~60ms

import_config "prod.secret.exs"
