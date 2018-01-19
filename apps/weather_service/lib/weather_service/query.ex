defmodule Weather.Query do
  import Ecto.Query, only: [from: 2]
  import WeatherService.Repo

  def get_active_cache(city) do
    query = from u in "weather_cache",
    where: u.city == ^city,
    select: u

    Repo.all(query)
  end
end