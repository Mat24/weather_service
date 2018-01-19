use Mix.Config

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :weather_service_web, WeatherServiceWeb.Endpoint,
  http: [port: 4001],
  server: false

config :weather_service_web,
  :weather_service_module, WeatherServiceWeb.WeatherServiceMock