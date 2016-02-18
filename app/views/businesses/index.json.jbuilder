json.array!(@businesses) do |business|
  json.extract! business, :id, :partnerships, :growth_metrics, :customer_success_stories, :awards, :patent, :pitch_id, :start_up_id
  json.url business_url(business, format: :json)
end
