defmodule ElixirIpsum.Repo do
  use Ecto.Repo,
    otp_app: :elixir_ipsum,
    adapter: Ecto.Adapters.Postgres
end
