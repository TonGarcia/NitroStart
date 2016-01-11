module TractionsHelper
  def traction_index_attrs
    traction_strategy_attrs+traction_results_attrs
  end

  def traction_strategy_attrs
    [:grow_strategy, :costumer_channels]
  end

  def traction_results_attrs
    [:formatted_conversion_cust, :formatted_daily_growth_rate]
  end
end