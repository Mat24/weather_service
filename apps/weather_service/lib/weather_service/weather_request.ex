defmodule WeatherRequest do
  defstruct city: nil

  def validate_params(params) do
    with {:ok, city} <- parse_city(params[:city]) do
      {:ok, %WeatherRequest{city: city}}
    end
  end

  #City parse constraints
  defp parse_city(nil), do: {:error, :city_is_required}
  defp parse_city(""), do: parse_city(nil)
  defp parse_city(city), do: {:ok, city}

end