# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :page,
  ecto_repos: [Page.Repo]

# Configures the endpoint
config :page, PageWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "wPDh2ict/8w4865JpgwcwZvgo+PRQb8Un/C38MXSEHNrJEbIxH2Uujq0GbxrshgA",
  render_errors: [view: PageWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Page.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:user_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
