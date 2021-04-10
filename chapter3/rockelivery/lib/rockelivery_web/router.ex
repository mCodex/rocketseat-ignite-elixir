defmodule RockeliveryWeb.Router do
  use RockeliveryWeb, :router

  alias RockeliveryWeb.Plugs.UUIDChecker

  pipeline :api do
    plug :accepts, ["json"]
    plug UUIDChecker
  end

  pipeline :auth do
    plug RockeliveryWeb.Auth.Pipeline

    plug :accepts, ["json"]
    plug UUIDChecker
  end

  scope "/api", RockeliveryWeb do
    pipe_through :auth

    resources "/users", UsersController, except: [:new, :edit, :create]

    resources "/items", ItemsController, except: [:new, :edit]

    resources "/orders", OrdersController, except: [:new, :edit]
  end

  scope "/api", RockeliveryWeb do
    pipe_through :api

    post "/users/", UsersController, :create
    post "/users/sign-in", UsersController, :sign_in
  end

  # Enables LiveDashboard only for development
  #
  # If you want to use the LiveDashboard in production, you should put
  # it behind authentication and allow only admins to access it.
  # If your application does not have an admins-only section yet,
  # you can use Plug.BasicAuth to set up some basic authentication
  # as long as you are also using SSL (which you should anyway).
  if Mix.env() in [:dev, :test] do
    import Phoenix.LiveDashboard.Router

    scope "/" do
      pipe_through [:fetch_session, :protect_from_forgery]
      live_dashboard "/dashboard", metrics: RockeliveryWeb.Telemetry
    end
  end
end
