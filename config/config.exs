# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :spiritpay,
  ecto_repos: [Spiritpay.Repo]

# Configures the endpoint
config :spiritpay, SpiritpayWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "vBVbYxI9q5x+PMmXMNAZQCJ2YXnzxR8iI70k2sn7UH60HLYtfHKMP9685bDDfU+W",
  render_errors: [view: SpiritpayWeb.ErrorView, accepts: ~w(json), layout: false],
  pubsub_server: Spiritpay.PubSub,
  live_view: [signing_salt: "RbWuPUMK"]

config :spiritpay, Spiritpay.Repo,
  migration_primary_key: [type: :binary_id],
  migration_foreign_key: [type: :binary_id]

config :spiritpay, :basic_auth,
  username: "spt",
  password: "xd"
# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
