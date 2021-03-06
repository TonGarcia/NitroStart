module TractionsHelper
  def traction_all_attrs
    traction_strategy_attrs+traction_range_attrs+traction_results_attrs
  end

  def traction_index_attrs
    traction_strategy_attrs+traction_results_attrs
  end

  def traction_strategy_attrs
    [:grow_strategy, :customer_channels]
  end

  def traction_range_attrs
    [:formatted_lead_cust, :formatted_amount_daily_lead]
  end

  def traction_results_attrs
    [:formatted_conversion_cust, :formatted_daily_growth_rate]
  end
end