defmodule WeatherServiceWeb.WeatherControllerSpec do
  use ESpec.Phoenix, controller: :true

  describe "WeatherControlleWeb" do
    context "when the request is valid" do
      let :request, do: "Cali"
      it "should return an :ok status code" do
        :index 
        |> response_get(request())
        |> get_status_code()
        |> expect
        |> to(eq 200)
      end

      it "should return a valid temperature" do
        :index 
        |> response_get(request())
        |> get_body()
        |> Map.get("temperature")
        |> String.split()
        |> Enum.at(0) 
        |> String.to_integer()
        |> is_integer()
        |> expect
        |> to(be_true())
      end
    end

    context "when the request is not valid" do
      let :request, do: "123"
      it "should return an :error code" do
        :index 
        |> response_get(request())
        |> get_status_code()
        |> expect
        |> to(eq 404)
      end
    end
  end
end