defmodule Weather do

  def weather(params) do
    with {:ok, validated_params} <-  WeatherRequest.validate_params(params),
         {:ok, response} <- get_from_api(validated_params),
         {:ok, weather_element} <- weather_data_cleaning(response)
         #{:ok, processed_weather} <- weather_data_processor(weather_element)
    do
      IO.inspect weather_element
      weather_element
    else
      err -> IO.inspect err
    end
  end

  def get_from_api(%WeatherRequest{city: city}) do
    endpoint = "#{get_api_url()}weather?q=#{city},co#{get_api_key()}"
  
    case HTTPoison.get(endpoint) do
      {:ok, response} -> {:ok, Poison.decode!(response.body)}
      error -> {:error, error}
    end
  end

  def weather_data_cleaning(weather_data) do
    location_name = get_in(weather_data, ["name"]) <>", "<>get_in(weather_data,["sys", "country"])
    temperature = get_in(weather_data, ["main", "temp"])
    wind = get_in(weather_data, ["wind"])
    cloudines = get_in(weather_data, ["weather"]) |> Enum.at(0) |> get_in(["description"])
    presure = get_in(weather_data, ["main", "pressure"])
    humidity = get_in(weather_data, ["main", "humidity"])
    sunrise = get_in(weather_data, ["sys", "sunrise"])
    sunset = get_in(weather_data, ["sys", "sunset"])
    geo_coordinates = [get_in(weather_data, ["coord", "lat"])] ++ [get_in(weather_data, ["coord", "lon"])]
    requested_time = get_in(weather_data, ["dt"])
   
    WeatherElement.validate_params(%{
      location_name: location_name,
      temperature: temperature,
      wind: wind,
      cloudines: cloudines,
      presure: presure,
      humidity: humidity,
      sunrise: sunrise,
      sunset: sunset,
      geo_coordinates: geo_coordinates,
      requested_time: requested_time
    })

  end

  def weather_data_processor(weather_element) do
    processed_weather =
      weather_element
      |> update_in([:temperature], &(&1 - 273.15))
    {:ok, processed_weather}   
  end

  def get_api_url do
    Application.get_env(:weather_service, :external_api)[:base_url]
  end

  def get_api_key do
    Application.get_env(:weather_service, :external_api)[:api_key]
  end

end