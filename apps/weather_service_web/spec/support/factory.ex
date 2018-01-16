defmodule WeatherServiceWeb.Factory do
  use ExMachina
  def weather_factory do
    %{
      location_name: Enum.random(["Bogota CO", "Cali CO", "Medellin CO"]),
      temperature: "#{Enum.random(5..40)} °C",
      wind: "",
      cloudines: "",
      presure: "",
      humidity: "",
      sunrise: "",
      sunset: "",
      geo_coordinates: "",
      requested_time: "",
    }
  end
end
