defmodule WeatherService.WeatherCache do
  use Ecto.Schema

  import Ecto.Changeset

  schema "weather_cache" do
    field :city, :string
    field :wind, :string # "1.51 m/s"
    field :temperature, :string # "24 °C"
    field :sunset, :time # "23:15"
    field :sunrise, :time # "11:18"
    field :requested_time, :utc_datetime # "16:0"
    field :presure, :string # "1018 hpa"
    field :location_name, :string # "Cali, CO"
    field :humidity, :string # "78%"
    field :geo_coordinates, :string # [3.43,-76.51]
    field :cloudines, :string #"broken clouds"

    timestamps()
  end

  # def changeset(weather, params \\ %{}) do
  #   weather
  #   |> cast(params, [:city, :wind, :temperature, :sunset, :sunrise,
  #                    :requested_time, :presure, :location_name, :humidity,
  #                    :geo_coordinates, :cloudines,])
  # end
end

# WeatherService.Repo.insert! %WeatherService.WeatherCache{ city: "Cali Co", wind: "1.51 m/s", temperature: "24 °C", sunset: "23:15", sunrise: "11:18", requested_time: "16:0", presure: "1018 hpa", location_name: "Cali Co", humidity: "78%", geo_coordinates: "[3.43,-76.51]", cloudines: "broken clouds"}

# :temperature,
# :sunset,
# :sunrise,
# :requested_time,
# :presure,
# :location_name,
# :humidity,
# :geo_coordinates,
# :cloudines,