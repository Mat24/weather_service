defmodule Weather do
  import Logger
  # Error handling when city is invalid or nil
  def weather(params, correlation_id) do
    Logger.info("Task ID: #{correlation_id} has been started "<>
                "with: #{inspect params}")
    case check_cache(params, DateTime.utc_now) do
      true -> {:ok, true}# return stored data
      false -> 
        with {:ok, validated_params} <-  WeatherRequest.validate_params(params),
             {:ok, response} <- get_from_api(validated_params),
             {:ok, weather_element} <- weather_data_cleaning(response),
             {:ok, processed_weather} <- weather_data_processor(weather_element),
             {:ok, _} <- make_cache(processed_weather)
        do
          Logger.info("Task ID: #{correlation_id} has a update:"<>
                      " #{inspect processed_weather}")
          {:ok, processed_weather}
        else
          err -> {:error, :internal_server_error}
        end
    end
  end

  def get_from_api(%WeatherRequest{city: city}) do
    endpoint = "#{get_api_url()}weather?q=#{city},co#{get_api_key()}"
    
    case HTTPoison.get(endpoint) do
      {:ok, response} -> 
        case Poison.decode!(response.body) do
          %{"cod" => _, "message" => _} -> {:error, :not_found}
          response -> {:ok, response}
        end
      error -> {:error, error}
    end
  end

  def weather_data_cleaning(weather_data) do

    {:ok, %{ city: "#{get_in(weather_data, ["name"])}",
      location_name: "#{get_in(weather_data, ["name"])}, "<>
                           "#{get_in(weather_data, ["sys", "country"])}",
      temperature: get_in(weather_data, ["main", "temp"]),
      wind: get_in(weather_data, ["wind","speed"]),
      cloudines: get_in(weather_data, ["weather"]) 
                                      |> Enum.at(0) 
                                      |> get_in(["description"]),
      presure: get_in(weather_data, ["main", "pressure"]),
      humidity: get_in(weather_data, ["main", "humidity"]),
      sunrise: get_in(weather_data, ["sys", "sunrise"]),
      sunset: get_in(weather_data, ["sys", "sunset"]),
      geo_coordinates: [get_in(weather_data, ["coord", "lat"])] ++ 
                       [get_in(weather_data, ["coord", "lon"])],
      requested_time: get_in(weather_data, ["dt"])}}
  end

  def weather_data_processor(weather_element) do
    processed_weather =
      weather_element
      |> Map.replace!(:temperature, 
                      "#{Utils.kelvin_to_celcius(weather_element.temperature)}"
                      <> " °C")
      |> Map.replace!(:wind, "#{weather_element.wind} m/s")
      |> Map.replace!(:presure, "#{weather_element.presure} hpa")
      |> Map.replace!(:humidity, "#{weather_element.humidity}%")
      |> Map.replace!(:sunrise, 
                      Utils.normal_time(weather_element.sunrise))
      |> Map.replace!(:sunset, Utils.normal_time(weather_element.sunset))
      |> Map.replace!(:requested_time, 
                      Utils.normalize_datetime(weather_element.requested_time))
    {:ok, processed_weather}
  end

  def check_cache(city, time) do
    # IO.inspect Weather.Query.get_active_cache(city) #Pending to implemnet!
    # query validation
    false
  end

  def make_cache(weather_data) do
    %WeatherService.WeatherCache{}
    |> Map.replace!(:city, weather_data.city)
    |> Map.replace!(:location_name, weather_data.location_name)
    |> Map.replace!(:temperature, weather_data.temperature)
    |> Map.replace!(:wind, weather_data.wind)
    |> Map.replace!(:cloudines, weather_data.cloudines)
    |> Map.replace!(:presure, weather_data.presure)
    |> Map.replace!(:humidity, weather_data.humidity)
    |> Map.replace!(:sunrise, weather_data.sunrise)
    |> Map.replace!(:sunset, weather_data.sunset)
    |> Map.replace!(:geo_coordinates, "#{inspect weather_data.geo_coordinates}")
    |> Map.replace!(:requested_time, weather_data.requested_time)
    |> WeatherService.Repo.insert!
    {:ok, weather_data}
  end

  def get_api_url do
    Application.get_env(:weather_service, :external_api)[:base_url]
  end

  def get_api_key do
    Application.get_env(:weather_service, :external_api)[:api_key]
  end  

end