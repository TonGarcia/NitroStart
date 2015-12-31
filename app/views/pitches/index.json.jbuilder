json.array!(@pitches) do |pitch|
  json.extract! pitch, :id, :name, :user_id
  json.url pitch_url(pitch, format: :json)
end
