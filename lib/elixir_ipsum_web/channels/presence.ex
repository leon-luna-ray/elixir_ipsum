defmodule ElixirIpsumWeb.Presence do
  @moduledoc """
  Provides presence tracking to channels and processes.

  See the [`Phoenix.Presence`](http://hexdocs.pm/phoenix/Phoenix.Presence.html)
  docs for more details.
  """
  use Phoenix.Presence, otp_app: :elixir_ipsum,
                        pubsub_server: ElixirIpsum.PubSub
end
