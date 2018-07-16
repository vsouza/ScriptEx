defmodule Weather do
  use Tesla

  plug Tesla.Middleware.BaseUrl, "http://api.openweathermap.org/data/2.5"
  plug Tesla.Middleware.JSON

  @appId "8c2c7dc235868637da74c1c9e3ef8a9d"

  def info(city) do
    city
    |> retrieve_info
  end

  defp retrieve_info(city) do
    get("/weather?q=" <> city <> "&APPID=" <> @appId)
    |> parse_response
    |> pretty_print
  end

  defp parse_response({:ok, %Tesla.Env{status: 200, body: body}}) do
    body
    %{
      "pressure" => body["main"]["pressure"],
      "temperature" => body["main"]["temp"],
      "humidity" => body["main"]["humidity"],
      "min" => body["main"]["temp_min"],
      "max" => body["main"]["temp_max"],
      "city" => body["name"]
    }
  end

  defp pretty_print(response) do
    IO.puts ~s<Weather on : #{response["city"]}>
    IO.puts ~s<Temperature: #{response["temperature"]}>
    IO.puts ~s<Pressure: #{response["pressure"]}>
    IO.puts ~s<Humidity: #{response["humidity"]}>
    IO.puts ~s<Min: #{response["min"]}>
    IO.puts ~s<Max: #{response["max"]}>
    IO.puts "=========================="
  end

end
