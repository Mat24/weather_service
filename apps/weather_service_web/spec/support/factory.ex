defmodule WeatherServiceWeb.Factory do
  use ExMachina
  def weather_factory do
    %{
      location_name: Enum.random(["Bogota CO", "Cali CO", "Medellin CO"]),
      temperature: "#{Enum.random(5..40)} °C",
      wind: "2.1 m/s",
      cloudines: "broken clouds",
      presure: "1018 hpa",
      humidity: "88%",
      sunrise: "11:18",
      sunset: "23:15",
      geo_coordinates: "[3.43, -76.51]",
      requested_time: "13:0",
    }
  end
end
