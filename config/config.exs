# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :phoenix_guardian,
  ecto_repos: [PhoenixGuardian.Repo]

# Configures the endpoint
config :phoenix_guardian, PhoenixGuardianWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "lDqMFWlDxNw81Re2RtynQNGOHfj6L7WXnPDND4CZcHmYzAke57lT8B1NuIFnVhDj",
  render_errors: [view: PhoenixGuardianWeb.ErrorView, accepts: ~w(json)],
  pubsub: [name: PhoenixGuardian.PubSub,
           adapter: Phoenix.PubSub.PG2]

config :guardian, Guardian,
  allowed_algos: ["HS512"],
  verify_module: Guardian.JWT,
  issuer: "PhoenixGuardian",
  ttl: { 30, :days },
  allowed_drift: 2000,
  verify_issuer: true,
  secret_key: "vXOrMhesPlDasxWC4pc1r7U+xuaxuJKFhy6okbkwWlc61Dn52I7cbjJii3LHMHOj",
  serializer: PhoenixGuardian.GuardianSerializer

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:user_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
