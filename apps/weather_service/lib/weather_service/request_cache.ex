defmodule WeatherService.WeatherCache do
  use Ecto.Schema

  schema "weather_cache" do
    field :city
    field :wind, :string # "1.51 m/s"
    field :temperature, :string # "24 °C"
    field :sunset, :string # "23:15"
    field :sunrise, :string # "11:18"
    field :requested_time, :string # "16:0"
    field :presure, :string # "1018 hpa"
    field :location_name, :string # "Cali, CO"
    field :humidity, :string # "78%"
    field :geo_coordinates, :string # [3.43,-76.51]
    field :cloudines, :string #"broken clouds"

    timestamps
  end
end

# WeatherService.Repo.insert! %WeatherService.WeatherCache{ city: "Cali Co", wind: "1.51 m/s", temperature: "24 °C", sunset: "23:15", sunrise: "11:18", requested_time: "16:0", presure: "1018 hpa", location_name: "Cali Co", humidity: "78%", geo_coordinates: "[3.43,-76.51]", cloudines: "broken clouds"}