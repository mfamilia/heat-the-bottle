# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :api,
  namespace: Api

# Configures the endpoint
config :api, ApiWeb.Endpoint,
  http: [port: 80],
  url: [host: "localhost"],
  secret_key_base: "rnwC3pCxMSWqSqIPmCUXjjZPwYcWA9UEVEqSCAbzZ/weBWGuCiZHMqBM6i/pWQpn",
  root: Path.dirname(__DIR__),
  pubsub: [name: Ui.PubSub, adapter: Phoenix.PubSub.PG2],
  render_errors: [accepts: ~w(json)],
  check_origin: false,
  server: true

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:user_id]
