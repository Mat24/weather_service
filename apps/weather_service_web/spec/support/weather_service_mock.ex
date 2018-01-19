defmodule WeatherServiceWeb.WeatherServiceMock do
  import WeatherServiceWeb.Factory

  def get_weather(_correlation_id, "Cali") do
    {:ok, build(:weather)}
  end

  def get_weather(_correlation_id, "123") do
    {:error, :not_found}
  end 
end

