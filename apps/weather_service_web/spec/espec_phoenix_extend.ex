defmodule ESpec.Phoenix.Extend do
  def model do
    quote do
      alias WeatherServiceWeb.Repo
    end
  end

  def controller do
    quote do
      # defecto: get, put_req_header
      alias WeatherServiceWeb
      import WeatherServiceWeb.Router.Helpers

      @endpoint WeatherServiceWeb.Endpoint

      def response_get(action, params) do
        ganerate_response()
        |> get(get_url(action, params))
      end

      def ganerate_response do
        build_conn()
        |> put_req_header("correlation_id", UUID.uuid4())
        |> put_req_header("accept", "application/json")
      end

      def get_url(action, params) do 
        # Mocking the routers
        weather_path(@endpoint, action, params)
      end

      def get_status_code(response), do: response.status
      def get_body(response), do: response.resp_body |> Poison.decode!
      def get_params(response), do: response.params
    end
  end

  def view do
    quote do
      import WeatherServiceWeb.Router.Helpers
    end
  end

  def channel do
    quote do
      alias WeatherServiceWeb.Repo

      @endpoint WeatherServiceWeb.Endpoint
    end
  end

  defmacro __using__(which) when is_atom(which) do
    apply(__MODULE__, which, [])
  end
end
 