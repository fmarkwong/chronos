# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :chronos,
  ecto_repos: [Chronos.Repo]

# Configures the endpoint
config :chronos, ChronosWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "bBkpTAibqB7vUhUukQ6qwXn1PxTGIlRajv04FIK+k30qbjmVfTJIl5Q52552iV9I",
  render_errors: [view: ChronosWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Chronos.PubSub, adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
