# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :typee,
  ecto_repos: [Typee.Repo]

# Configures the endpoint
config :typee, TypeeWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "Q43kyefh2IvZPaL9i4pdqCvGtzeAZOzP0rVsFWG3tdb1HGful169IpNass3jzZQl",
  render_errors: [view: TypeeWeb.ErrorView, accepts: ~w(json), layout: false],
  pubsub_server: Typee.PubSub,
  live_view: [signing_salt: "AnHZuwqL"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
