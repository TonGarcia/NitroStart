json.array!(@competitors) do |competitor|
  json.extract! competitor, :id, :name, :success_story, :your_advantage, :pitch_id, :start_up_id
  json.url competitor_url(competitor, format: :json)
end
