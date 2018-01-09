defmodule WeatherServiceWeb.WeatherController do
  use WeatherServiceWeb, :controller

  # annotation / module attributes
  @weather_api Application.get_env(:weather_service_web, :weather_service_module)

  def index(conn, %{"city" => city}) do
    {:ok, data} =  @weather_api.get_weather(city)
    render conn, "show.json", %{weather: data}
  end

end
