defmodule Greeter do
  def get_json() do
    with {:ok, contents} <- File.read("d:\\work\\elixir\\brownbag\\game.json"),
         {:ok, json} <- Jason.decode!(contents),
         do: IO.puts("#{json}")
  end
end
