module MarketsHelper
  def market_all_attrs
    market_segment_attrs+market_range_attrs
  end

  def market_index_attrs
    [:segment, :formatted_total_costumers, :formatted_total_money]
  end

  def market_segment_attrs
    [:segment, :trends_insight, :formatted_costumer_specification]
  end

  def market_range_attrs
    [:formatted_total_costumers, :formatted_total_money]
  end
end