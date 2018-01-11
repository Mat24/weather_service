defmodule WeatherServiceSpec do
  use ESpec
  alias WeatherService

  describe "Weather_service" do
    context "when the request is valid" do
      let :response, do: "{\"coord\":{\"lon\":-74.08,\"lat\":4.6},\"weather\":[{\"id\":802,\"main\":\"Clouds\",\"description\":\"scattered clouds\",\"icon\":\"03d\"}],\"base\":\"stations\",\"main\":{\"temp\":290.15,\"pressure\":1024,\"humidity\":51,\"temp_min\":290.15,\"temp_max\":290.15},\"visibility\":10000,\"wind\":{\"speed\":5.1,\"deg\":60},\"clouds\":{\"all\":40},\"dt\":1515704400,\"sys\":{\"type\":1,\"id\":4245,\"message\":0.0044,\"country\":\"CO\",\"sunrise\":1515668896,\"sunset\":1515711664},\"id\":3688689,\"name\":\"Bogota\",\"cod\":200}"
      let :valid_request, do: "Bogota"
      before do
        # allow HTTPoison
        # |> to(accept(:get, fn("mock.com/weather/city") -> {:ok, %HTTPoison.Response{
        #   status_code: 200,
        #   body: response()
        # }}end))
      end 
      
      it "shoud return :ok" do
        "correlation_id"
        |> WeatherService.get_weather(valid_request())
        |> IO.inspect
      end

      
    end

    context "when the request is invalid" do
      
    end
  end
end