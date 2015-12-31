json.array!(@investments) do |investment|
  json.extract! investment, :id, :general_terms, :raising_time, :founder_salaries, :costumer_conversion, :product_development, :equipments, :pitch_id, :start_up_id
  json.url investment_url(investment, format: :json)
end
