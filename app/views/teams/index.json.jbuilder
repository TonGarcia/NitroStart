json.array!(@teams) do |team|
  json.extract! team, :id, :pitch_id, :start_up_id
  json.url team_url(team, format: :json)
end
