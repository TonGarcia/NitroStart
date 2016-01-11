module MarketsHelper
  def market_index_attrs
    [:segment, :formatted_total_costumers, :formatted_total_money]
  end

  def market_segment_attrs
    [:segment, :trends_insight, :costumer_specification]
  end

  def market_range_attrs
    [:formatted_total_costumers, :formatted_total_money]
  end
end