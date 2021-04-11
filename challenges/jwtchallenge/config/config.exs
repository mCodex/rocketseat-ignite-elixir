# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :jwtchallenge,
  ecto_repos: [Jwtchallenge.Repo]

config :jwtchallenge, Jwtchallenge.Repo,
  migration_primary_key: [type: :binary_id],
  migration_foreign_key: [type: :binary_id]

config :jwtchallenge, JwtchallengeWeb.Auth.Guardian,
  issuer: "jwtchallenge",
  secret_key: "aMlzjAV4CxqmfaPZqNtvNP18YsjScNfmpC2gEKW8HepBbGHJZg3QoeTLxMT/Xn9c"

config :jwtchallenge, JwtchallengeWeb.Auth.Pipeline,
  module: JwtchallengeWeb.Auth.Guardian,
  error_handler: JwtchallengeWeb.Auth.ErrorHandler

# Configures the endpoint
config :jwtchallenge, JwtchallengeWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "vN+Z+GzAhikYlco0Wy1x/4IKBC1BOP9+eMHlSnmlCM25WKxUCn71E8kWWm5NZa6U",
  render_errors: [view: JwtchallengeWeb.ErrorView, accepts: ~w(json), layout: false],
  pubsub_server: Jwtchallenge.PubSub,
  live_view: [signing_salt: "XZsIdleh"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
