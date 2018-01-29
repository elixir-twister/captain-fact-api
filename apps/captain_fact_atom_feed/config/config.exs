# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :captain_fact_atom_feed,
  namespace: CaptainFactAtomFeed,
  ecto_repos: [DB.Repo]

config :captain_fact_atom_feed,
  CaptainFactAtomFeed.Router, cowboy: [port: 4004]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"