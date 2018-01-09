defmodule WeatherServiceWeb.WeatherController do
  use WeatherServiceWeb, :controller

  @weather_api Application.get_env(:weather_service_web, :weather_service_module)

  def index(conn, _params) do
    {:ok, data} =  @weather_api.get_weather(%{})
    render conn, "show.json", %{weather: data}
  end

end
