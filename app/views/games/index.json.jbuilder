json.array!(@games) do |game|
  json.extract! game, :id, :game_name, :score_limit, :number_of_players, :winner_team
  json.url game_url(game, format: :json)
end
