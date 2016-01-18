module FinancialsHelper
  def financial_index_attrs
    [:formatted_total_users, :formatted_total_revenue, :formatted_total_expense]
  end

  def financial_currencies_attrs
    [:formatted_bootstrapped, :formatted_total_revenue, :formatted_total_expense]
  end

  def financial_market_share_attrs
    [:formatted_total_users, :formatted_total_costumers, :formatted_market_penetration]
  end
end