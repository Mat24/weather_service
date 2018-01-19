defmodule WeatherServiceWeb.Router do
  use WeatherServiceWeb, :router
  @correlation_id "correlation-id"

  pipeline :api do
    plug :accepts, ["json"]
    plug :add_correlation_id
  end

  def add_correlation_id(conn, _options) do
     put_req_header(conn, @correlation_id, UUID.uuid4)
  end

  scope "/", WeatherServiceWeb do
    pipe_through :api # Use the default browser stack

    get "weather/:city", WeatherController, :index 
  end

  # Other scopes may use custom stacks.
  # scope "/api", WeatherServiceWeb do
  #   pipe_through :api
  # end
end
