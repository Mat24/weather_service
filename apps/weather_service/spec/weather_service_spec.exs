defmodule WeatherServiceSpec do
  use ESpec
  alias WeatherService

  describe "Weather_service" do
    context "when the request is valid" do
      let :response, do: shared.api_response
      let :valid_request, do: "Bogota"
      before do
        allow HTTPoison
        |> to(accept(:get,
          fn
            (_url) -> {:ok, %HTTPoison.Response{status_code: 200, body: response()}}
          end
        ))
      end 
      
      it "shoud return :ok" do
        "correlation_id"
        |> WeatherService.get_weather(valid_request())
        |> expect
        |> to(be_ok_result())
      end

      it "should not return :blank response" do
        "correlation_id"
        |> WeatherService.get_weather(valid_request())
        |> expect
        |> to_not(eq nil)
      end

      it "should return a valid response structure" do

        {:ok, response} = WeatherService.get_weather("correlation_id",
                                                     valid_request())
        
        response |> Map.get(:temperature) |> expect |> to(eq "17 °C")
      end

      
    end

    context "when the request is invalid" do
      let :invalid_request, do: "12345"
      let :response, do: "{\"cod\":\"404\",\"message\":\"city not found\"}"
      before do
        allow HTTPoison
        |> to(accept(:get,
          fn
            (_url) -> {:ok, %HTTPoison.Response{status_code: 404, body: response()}}
          end
        ))
      end 

      it "should return :error" do
        "correlation_id"
        |> WeatherService.get_weather(invalid_request())
        |> expect
        |> to(be_error_result())
      end
    end
  end
end
