# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :rss_herder,
  ecto_repos: [RssHerder.Repo]

# Configures the endpoint
config :rss_herder, RssHerder.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "QtLNidTtze0KR2ZHrvaSepPSKhJ5bEK8qT6Ojliib0fuTw7edIIg7fTNo20q+FSV",
  render_errors: [view: RssHerder.ErrorView, accepts: ~w(html json)],
  pubsub: [name: RssHerder.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"

# %% Coherence Configuration %%   Don't remove this line
config :coherence,
  user_schema: RssHerder.User,
  repo: RssHerder.Repo,
  module: RssHerder,
  logged_out_url: "/",
  email_from_name: "Sean Eshbaugh",
  email_from_email: "seaneshbaugh@gmail.com",
  opts: [:invitable, :confirmable, :authenticatable, :recoverable, :lockable, :trackable, :unlockable_with_token, :registerable]

config :coherence, RssHerder.Coherence.Mailer,
  adapter: Swoosh.Adapters.SMTP,
  relay: "localhost"
  #api_key: "your api key here"
# %% End Coherence Configuration %%
