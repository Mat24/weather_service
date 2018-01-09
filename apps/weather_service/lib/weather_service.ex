defmodule WeatherService do
  @moduledoc """
  Documentation for WeatherService.
  """

  @doc """
  get weather from external api.

  ## Examples

      iex> WeatherService.get_weather
      :world

  """
  @spec get_weather(map) :: {:ok, map} | {:error, atom}
  def get_weather(params) do
    {:ok, %{id: 1}}
  end
end
