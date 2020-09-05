# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :parser,
  ecto_repos: [Parser.Repo]

# Configures the endpoint
config :parser, ParserWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "1L7YjUdsls6ZHCBK4Or4bfviG7k4nAqIijGZBdGiNMUN1wwJpPrPU+BiKoch0QUO",
  render_errors: [view: ParserWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: Parser.PubSub,
  live_view: [signing_salt: "Sz84YqcI"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
