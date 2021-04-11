# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :githubrepogetter,
  ecto_repos: [Githubrepogetter.Repo]

# Configures the endpoint
config :githubrepogetter, GithubrepogetterWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "MOXWCDQT2lH7G8LWJzlTfuSiZOskm1hmIXvwo4L2nKEqxGmyqFNcBq+AqvK/rOc9",
  render_errors: [view: GithubrepogetterWeb.ErrorView, accepts: ~w(json), layout: false],
  pubsub_server: Githubrepogetter.PubSub,
  live_view: [signing_salt: "/FJN0ItW"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
