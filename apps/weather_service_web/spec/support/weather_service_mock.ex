defmodule WeatherServiceWeb.WeatherServiceMock do
  #import WeatherServiceWeb.Factory

  def get_weather(_correlation_id, city) do
    # {:ok, build(:weather)}
    IO.inspect(city, label: "MOCK...")
    
    {:ok, %{cloudines: "haze", geo_coordinates: [3.43, -76.51], humidity: "88%",
    location_name: "Cali, CO", presure: "1018 hpa", requested_time: "15:0",
    sunrise: "11:17", sunset: "23:14", temperature: "23 °C", wind: "1.5 m/s"}
    }
  end
end

