use Mix.Config


config :weather_service, :external_api,
  base_url: "http://api.openweathermap.org/data/2.5/",
  api_key: "&appid=1508a9a4840a5574c822d70ca2132032"

config :weather_service, WeatherService.Repo,
  adapter: Ecto.Adapters.Postgres,
  database: "weather_service_dev",
  username: "postgres",
  password: "lol12345",
  hostname: "localhost",
  pool_size: 5

config :weather_service, ecto_repos: [WeatherService.Repo]
  # OR use a URL to connect instead
  # url: "postgres://postgres:postgres@localhost/ecto_simple"

#config :open_weather, :base_url, ""

#onfig :wather_service, :expiration_time, 5