# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :metricator,
  ecto_repos: [Metricator.Repo]

# Configures the endpoint
config :metricator, MetricatorWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "FqpnmbeNQ/h5S2mNFTtG+AzbY7TGhrSvdwiT4b21+WEm+aDz95sfu8StjKTPYvPN",
  render_errors: [view: MetricatorWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: Metricator.PubSub,
  live_view: [signing_salt: "RBc6VoFO"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
