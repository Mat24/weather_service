defmodule WeatherService do
  @moduledoc """
  Documentation for WeatherService.
  """

  import Logger

  @doc """
  get weather from external api.

  ## Examples

      iex> WeatherService.get_weather
      :world

  """
  @spec get_weather(String.t, String.t) :: {:ok, String.t} | {:error, atom}
  def get_weather(correlation_id, city) do
    Logger.info("Getting Weather: #{correlation_id}")
    Weather.weather(%{city: city})
    #{:ok, }}
  end
end
