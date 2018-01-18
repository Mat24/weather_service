defmodule WeatherService.Application do
  @moduledoc """
  The WeatherService Application Service.

  The weather_service system business domain lives in this application.

  Exposes API to clients such as the `WeatherServiceWeb` application
  for use in channels, controllers, and elsewhere.
  """
  use Application

  def start(_type, _args) do
    import Supervisor.Spec, warn: false

    Supervisor.start_link([
      supervisor(WeatherService.Repo, [])
    ], strategy: :one_for_one, name: WeatherService.Supervisor)
  end
end
