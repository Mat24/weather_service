# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :weather_service_web,
  namespace: WeatherServiceWeb

# Configures the endpoint
config :weather_service_web, WeatherServiceWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "cB3pOD1mHCV5Q7n/81iCgRtef3PyF732HUKWObHgtn6j9zKDCev0WgJc6p8ia6+D",
  render_errors: [view: WeatherServiceWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: WeatherServiceWeb.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

config :weather_service_web, :generators,
  context_app: :weather_service

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
