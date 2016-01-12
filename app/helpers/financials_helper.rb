module FinancialsHelper
  def financial_index_attrs
    [:total_user, :total_revenue, :total_expense]
  end

  def financial_currencies_attrs
    [:total_revenue, :total_expense]
  end

  def financial_market_share_attrs
    [:total_user, :total_costumer, :market_penetration]
  end
end