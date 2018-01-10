defmodule WeatherServiceWeb.WeatherController do
  use WeatherServiceWeb, :controller

  # annotation / module attributes, to backend calls
  @weather_api Application.get_env(:weather_service_web, :weather_service_module)

  def index(conn, %{"city" => city}) do
    with correlation_id  <- get_correlation_id(conn),
         {:ok, data} <- @weather_api.get_weather(correlation_id, city) 
    do
      render conn, "show.json", %{weather: data}
    end
  end

  def get_correlation_id(conn) do
    conn
    |> get_req_header("correlation-id")
    |> List.first
  end

end
