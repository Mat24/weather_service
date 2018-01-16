defmodule WeatherServiceWeb.WeatherControllerSpec do
  use ESpec.Phoenix, controller: :true

  describe "WeatherControlleWeb" do
    context "when the request is valid" do
      let :request, do: "Cali"
      it "" do
        :index 
        |> response_get(request())
        |> IO.inspect
        |> get_status_code()
        |> expect
        |> to(eq 200)
      end

      it "" do
        :index 
        |> response_get(request())
        |> IO.inspect
        |> get_body()
        |> Map.get(:temperature)
        |> expect
        |> to(eq "23 °C")
      end
    end

    context "when the request is not valid" do
      
    end
  end
end