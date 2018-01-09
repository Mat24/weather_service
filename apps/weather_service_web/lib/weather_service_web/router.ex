defmodule WeatherServiceWeb.Router do
  use WeatherServiceWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
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
