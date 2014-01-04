json.array!(@teams) do |team|
  json.extract! team, :id, :team_name, :total_score, :turn_number
  json.url team_url(team, format: :json)
end
