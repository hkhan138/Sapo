json.array!(@players) do |player|
  json.extract! player, :id, :player_name, :score, :turn_number
  json.url player_url(player, format: :json)
end
