# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :ballot_box,
  ecto_repos: [BallotBox.Repo]

# Configures the endpoint
config :ballot_box, BallotBox.Web.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "as3FkTLU85RuZAC2aPkTwXkwmjABrnK+tcs81g+Dp0QKpbsyEIBLsmzJdyGGXrOi",
  render_errors: [view: BallotBox.Web.ErrorView, accepts: ~w(html json)],
  pubsub: [name: BallotBox.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

config :ueberauth, Ueberauth,
  providers: [
    github: { Ueberauth.Strategy.Github, [ ] }
  ]

config :ueberauth, Ueberauth.Strategy.Github.OAuth,
  client_id: "1af7c4e923cd6b9502ae",
  client_secret: "02fff98cc6941f2472e0a1a68688de24adf5cd91"
# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
