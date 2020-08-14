# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :reacto,
  ecto_repos: [Reacto.Repo]

# Configures the endpoint
config :reacto, ReactoWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "nRfEnhgX/347aUrkD8hIZq65LCVCdQ1B1HEqnfviwBIWtkmR49k7aRhK41BEZxLs",
  render_errors: [view: ReactoWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: Reacto.PubSub,
  live_view: [signing_salt: "2d+jq1pK"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
