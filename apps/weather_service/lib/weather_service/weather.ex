defmodule Weather do
  # Error handling when city is invalid or nil
  def weather(params) do
    with {:ok, validated_params} <-  WeatherRequest.validate_params(params),
         {:ok, response} <- get_from_api(validated_params),
         {:ok, weather_element} <- weather_data_cleaning(response),
         {:ok, processed_weather} <- weather_data_processor(weather_element)
    do
      {:ok, processed_weather}
    else
      err -> IO.inspect err
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
      error -> 
        {:error, error}
        
    end
  end

  def weather_data_cleaning(weather_data) do

    {:ok, %{location_name: "#{get_in(weather_data, ["name"])}, "<>
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
                      Utils.normal_time(weather_element.requested_time))
    {:ok, processed_weather}
  end

  def get_api_url do
    Application.get_env(:weather_service, :external_api)[:base_url]
  end

  def get_api_key do
    Application.get_env(:weather_service, :external_api)[:api_key]
  end  

end