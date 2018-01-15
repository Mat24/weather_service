defmodule WeatherElement do
  defstruct location_name: nil,
            temperature: nil,
            wind: nil,
            cloudines: nil,
            presure: nil,
            humidity: nil,
            sunrise: nil,
            sunset: nil,
            geo_coordinates: nil,
            requested_time: nil

  def validate_params(params) do
    with {:ok, location_name} <- parse_location_name(params[:location_name]),
         {:ok, temperature} <- parse_temperature(params[:temperature]),
         {:ok, wind} <- parse_wind(params[:wind]),
         {:ok, cloudines} <- parse_cloudines(params[:cloudines]),
         {:ok, presure} <- parse_presure(params[:presure]),
         {:ok, humidity} <- parse_humidity(params[:humidity]),
         {:ok, sunrise} <- parse_sunrise(params[:sunrise]),
         {:ok, sunset} <- parse_sunset(params[:sunset]),
         {:ok, geo_coordinates} <- 
          parse_geo_coordinates(params[:geo_coordinates]),
         {:ok, requested_time} <- parse_requested_time(params[:requested_time])
    do
      {:ok, %WeatherElement{location_name: location_name,
                            temperature: temperature,
                            wind: wind,
                            cloudines: cloudines,
                            presure: presure,
                            humidity: humidity,
                            sunrise: sunrise,
                            sunset: sunset,
                            geo_coordinates: geo_coordinates,
                            requested_time: requested_time,}}
    else
      err -> err
    end
  end

  #location_name parse constraints
  defp parse_location_name(nil), do: {:error, :location_name_is_required}
  defp parse_location_name(""), do: parse_location_name(nil)
  defp parse_location_name(location_name), do: {:ok, location_name}
  #temperature parse constraints
  defp parse_temperature(nil), do: {:error, :temperature_is_required}
  defp parse_temperature(""), do: parse_temperature(nil)
  defp parse_temperature(temperature), do: {:ok, temperature}
  #wind parse constraints
  defp parse_wind(nil), do: {:error, :wind_is_required}
  defp parse_wind(""), do: parse_wind(nil)
  defp parse_wind(wind), do: {:ok, wind}
  #cloudines parse constraints
  defp parse_cloudines(nil), do: {:error, :cloudines_is_required}
  defp parse_cloudines(""), do: parse_cloudines(nil)
  defp parse_cloudines(cloudines), do: {:ok, cloudines}
  #presure parse constraints
  defp parse_presure(nil), do: {:error, :presure_is_required}
  defp parse_presure(""), do: parse_presure(nil)
  defp parse_presure(presure), do: {:ok, presure}
  #humidity parse constraints
  defp parse_humidity(nil), do: {:error, :humidity_is_required}
  defp parse_humidity(""), do: parse_humidity(nil)
  defp parse_humidity(humidity), do: {:ok, humidity}
  #sunrise parse constraints
  defp parse_sunrise(nil), do: {:error, :sunrise_is_required}
  defp parse_sunrise(""), do: parse_sunrise(nil)
  defp parse_sunrise(sunrise), do: {:ok, sunrise}
  #sunset parse constraints
  defp parse_sunset(nil), do: {:error, :sunset_is_required}
  defp parse_sunset(""), do: parse_sunset(nil)
  defp parse_sunset(sunset), do: {:ok, sunset}
  #geo_coordinates parse constraints
  defp parse_geo_coordinates(nil), do: {:error, :geo_coordinates_is_required}
  defp parse_geo_coordinates(""), do: parse_geo_coordinates(nil)
  defp parse_geo_coordinates(geo_coordinates), do: {:ok, geo_coordinates}
  #requested_time parse constraints
  defp parse_requested_time(nil), do: {:error, :requested_time_is_required}
  defp parse_requested_time(""), do: parse_requested_time(nil)
  defp parse_requested_time(requested_time), do: {:ok, requested_time}
  
end