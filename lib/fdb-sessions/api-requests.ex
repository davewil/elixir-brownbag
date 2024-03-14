defmodule SportData.Api do

  def get_fixtures() do
    #round - &round=regular%20season%20-%2027
    fixtures_url = "https://v3.football.api-sports.io/fixtures?league=39&season=2023&round=regular%20season%20-%2027"
    api_key = "35abcbaddbae42ea3f9b89fb5a9b7924"
    #req = Req.new(base_url: fixtures_url, headers: %{"x-rapidapi-host" => "v3.football.api-sports.io", "x-rapidapi-key" => api_key})

    data = Req.get!(fixtures_url, headers: %{"x-rapidapi-host" => "v3.football.api-sports.io", "x-rapidapi-key" => api_key}, decode_json: [keys: :atoms]).body

    [first_fixture, second_fixture, _, _, fifth_fixture | _] = data.response


    IO.puts "#{first_fixture.teams.home.name} vs #{first_fixture.teams.away.name}"
    IO.puts "#{second_fixture.teams.home.name} vs #{second_fixture.teams.away.name}"
    IO.puts "#{fifth_fixture.teams.home.name} vs #{fifth_fixture.teams.away.name}"


  end
end
