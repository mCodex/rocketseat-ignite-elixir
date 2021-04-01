# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :mealcon,
  ecto_repos: [Mealcon.Repo]

# Configures the endpoint
config :mealcon, MealconWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "zLkhsgE2yMpRaVwPfaMfg1KHpNiS+foG5pBAKl+1pJSNoOoXcRLRfRDU54oq/z2Y",
  render_errors: [view: MealconWeb.ErrorView, accepts: ~w(json), layout: false],
  pubsub_server: Mealcon.PubSub,
  live_view: [signing_salt: "kELedIJW"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
