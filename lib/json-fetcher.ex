defmodule JsonFetcher do
  def get_json() do
    with {:ok, contents} <- File.read("./game.json"),
         {:ok, json} <- Jason.decode!(contents),
         do: IO.puts("#{json}")
  end

  @spec hello() :: <<_::40>>
  def hello() do
    "hello"
  end

  def get_json2() do
    with data <-
           Req.get!("https://upredict.co.uk/games/39-2023-27", decode_json: [keys: :atoms]).body,
         %{player: player, matchdays: matchdays} <- data,
         %{name: home_team} <- hd(matchdays.requested.fixtures).homeTeam do
      "#{player.isPlaying} " <> "#{home_team}"
    else
      err -> err
    end

    # Map.fetch(data, :player)
    # Map.fetch(data, :matchdays)

    # with {:ok, player} <- Map.fetch(data, :player),
    #      {:ok, matchdays} <- Map.fetch(data, :matchdays),
    #      do: "#{player.isPlaying} " <> "#{matchdays.requested.id}"
  end
end
