json.array!(@markets) do |market|
  json.extract! market, :id, :total_costumers, :total_money, :trends_insight, :costumer_specification, :pitch_id, :start_up_id
  json.url market_url(market, format: :json)
end
