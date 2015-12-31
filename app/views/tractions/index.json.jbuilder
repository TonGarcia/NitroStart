json.array!(@tractions) do |traction|
  json.extract! traction, :id, :grow_strategy, :growth_rate, :market_meet_channel, :conversion_rate, :pitch_id, :start_up_id
  json.url traction_url(traction, format: :json)
end
