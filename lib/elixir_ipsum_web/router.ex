defmodule ElixirIpsumWeb.Router do
  use ElixirIpsumWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", ElixirIpsumWeb do
    pipe_through :browser

    get "/", PageController, :index
  end

  scope "/api/v1", ElixirIpsumWeb do
    pipe_through :api

    get "/lorem", TextController, :index
  end

  if Mix.env() in [:dev, :test] do
    import Phoenix.LiveDashboard.Router

    scope "/" do
      pipe_through :browser
      live_dashboard "/dashboard", metrics: ElixirIpsumWeb.Telemetry
    end
  end
end
