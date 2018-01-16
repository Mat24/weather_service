defmodule WeatherServiceWeb.Factory do
  use ExMachina

  def weather_factory do
    %{
      location_name: sequence(:location_name, ["Bogota CO", "Cali CO", "Medellin CO"]),
      temperature: build(:temperature),
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

  def temperature_factory do
   %{
     temperature: "#{Enum.random(5..40)} °C"
   }
  end
end