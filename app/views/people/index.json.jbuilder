json.array!(@markets) do |market|
  json.extract! market, :id, :total_customers, :total_money, :trends_insight, :customer_specification, :pitch_id, :start_up_id
  json.url market_url(market, format: :json)
end
