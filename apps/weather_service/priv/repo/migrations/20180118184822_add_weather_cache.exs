defmodule WeatherService.Repo.Migrations.AddWeatherCache do
  use Ecto.Migration

  def change do
    create table(:weather_cache) do
      add :city, :string # Cali
      add :wind, :string # "1.51 m/s"
      add :temperature, :string # "24 °C"
      add :sunset, :time # "23:15"
      add :sunrise, :time # "11:18"
      add :requested_time, :utc_datetime # "16:0"
      add :presure, :string # "1018 hpa"
      add :location_name, :string # "Cali, CO"
      add :humidity, :string # "78%"
      add :geo_coordinates, :string # [3.43,-76.51]
      add :cloudines, :string #"broken clouds"

      timestamps
    end
  end
end
