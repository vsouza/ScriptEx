defmodule Scriptex do
  def main(_args) do
    execute_command(_args)
  end

  defp execute_command(["weather" | params]) do
    Enum.join(params, " ")
    |> Weather.info
  end
end
