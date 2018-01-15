use Mix.Config

config :weather_service, :external_api,
  base_url: "http://mock.com/weather/city",
  api_key: "&appid=none"
