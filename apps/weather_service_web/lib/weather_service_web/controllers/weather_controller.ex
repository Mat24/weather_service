defmodule WeatherServiceWeb.WeatherController do
  use WeatherServiceWeb, :controller
  alias WeatherServiceWeb.ErrorView

  # annotation / module attributes, to backend calls
  @weather_api Application.get_env(:weather_service_web, :weather_service_module)

  def index(conn, %{"city" => city}) do
    with correlation_id  <- get_correlation_id(conn),
         {:ok, data} <- @weather_api.get_weather(correlation_id, city)
    do
      render conn, "show.json", %{weather: data}
    else
      {:error, :not_found} -> 
        conn
        |> put_status(:not_found)
        |> render(ErrorView, "404.json")
      error -> render(conn, ErrorView, "500.json")
    end
  end

  def get_correlation_id(conn) do
    conn
    |> get_req_header("correlation-id")
    |> List.first
  end

end
