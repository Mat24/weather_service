defmodule WeatherServiceWeb.WeatherView do
  use WeatherServiceWeb, :view

  def render("show.json", %{weather: weather}) do
    weather
  end
end
