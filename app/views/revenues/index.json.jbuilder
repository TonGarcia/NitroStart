json.array!(@revenues) do |revenue|
  json.extract! revenue, :id, :price, :model, :pitch_id
  json.url revenue_url(revenue, format: :json)
end
