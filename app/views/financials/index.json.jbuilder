json.array!(@financials) do |financial|
  json.extract! financial, :id, :total_costumer, :total_revenue, :total_expense, :conversion_price, :market_penetration, :pitch_id, :start_up_id
  json.url financial_url(financial, format: :json)
end
