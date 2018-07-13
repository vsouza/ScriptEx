defmodule Weather do
  use Tesla

  plug Tesla.Middleware.BaseUrl, "http://samples.openweathermap.org/data/2.5"
  plug Tesla.Middleware.JSON

  @appId "b6907d289e10d714a6e88b30761fae22"

  def get(city) do
    city
    |> retrieve_info
  end

  defp retrieve_info(city) do
    get("/weather?q=" <> city <> "&appid=" <> @appId)
    |> parse_response
    |> pretty_print
  end

  defp parse_response(%Tesla.Env{status: 200, body: body}) do
    %{
      "temp" => body["main"]["temp"],
      "pressure" => body["main"]["pressure"],
      "humidity" => body["main"]["humidity"]
    }
  end

  defp pretty_print(response) do
    IO.puts "Weather: "
    IO.puts "Humidity: #{response['humidity']}"
    IO.puts "=========================="
  end

end
