defmodule Utils do
  def kelvin_to_celcius(kelvin_grades), do: round(kelvin_grades - 273.15)

  def normal_time(unix_time) do
    with {:ok, date} <- DateTime.from_unix(unix_time),
         {:ok, time} <- get_hours(date)
    do
      time
    else
      err -> err
    end

  end

  defp get_hours(date_time) do
    hours = date_time.hour
    minutes = date_time.minute

    {:ok, "#{hours}:#{minutes}"}
  end
end