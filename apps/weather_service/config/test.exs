use Mix.Config

config :weather_service, :external_api,
  base_url: "http://mock.com/weather/city",
  api_key: "&appid=none"

config :weather_service, WeatherService.Repo,
  adapter: Ecto.Adapters.Postgres,
  database: "weather_service_test",
  username: "postgres",
  password: "lol12345",
  hostname: "localhost",
  pool_size: 5

config :weather_service, ecto_repos: [WeatherService.Repo]
