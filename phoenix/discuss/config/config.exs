# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :discuss,
  ecto_repos: [Discuss.Repo]

# Configures the endpoint
config :discuss, Discuss.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "5HFVpAVcvWFLEqeXF3ViQh6Y3tnMczJkgp/lkBsqDcTMDgSAjlMl425iAVcuYDzK",
  render_errors: [view: Discuss.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Discuss.PubSub, adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"

# config :ueberauth, :Ueberauth,
#   providers: [
#     github: {Ueberauth.Strategy.Github, []}
#   ]

# config :ueberauth, Ueberauth.Strategy.Github.OAuth,
#   client_id: "a17dd4916fecee3de231",
#   client_secret: "3a3c801cf931d1febd6562494f58e2af44edf050"

# Configer Ueberauth providers
config :ueberauth, Ueberauth,
  providers: [
    github: {Ueberauth.Strategy.Github, [default_scope: "user:email"]}
  ]

config :ueberauth, Ueberauth.Strategy.Github.OAuth,
  client_id: "a17dd4916fecee3de231",
  client_secret: "3a3c801cf931d1febd6562494f58e2af44edf050"
