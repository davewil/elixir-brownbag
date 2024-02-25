defmodule JsonFetcher do
  def get_json() do
    with {:ok, contents} <- File.read("d:\\work\\elixir\\elixir-brownbag\\game.json"),
         {:ok, json} <- Jason.decode!(contents),
         do: IO.puts("#{json}")
  end

  def get_json2() do
    data = Req.get!("https://upredict.co.uk/games/39-2023-26").body

    Map.fetch(data, "player")
    Map.fetch(data, "matchdays")

    with {:ok, player} <- Map.fetch(data, "player"),
         {:ok, matchdays} <- Map.fetch(data, "matchdays"),
         do: "#{player["isPlaying"]} " <> "#{matchdays["requested"]["id"]}"
  end
end
