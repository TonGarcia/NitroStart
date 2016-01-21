json.array!(@campaigns) do |campaign|
  json.extract! campaign, :id, :link, :visible_attrs, :body
  json.url campaign_url(campaign, format: :json)
end
