defmodule WeatherRequest do
  defstruct city: nil

  def validate_params(params) do
    IO.inspect params
    with {:ok, city} <- parse_city(params[:city]) do
      {:ok, %WeatherRequest{city: city}}
    else
      err -> err
    end
  end

  #City parse constraints
  defp parse_city(nil), do: {:error, :city_is_required}
  defp parse_city(""), do: parse_city(nil)
  defp parse_city(city), do: {:ok, city}

end