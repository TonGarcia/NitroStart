# Capability Formatter methods
module Formatter
  extend ActiveSupport::Concern

  # Int Formatters
  def formatted_total_users
    self.total_users.to_s.to_int_formatter
  end

  # Formatted Total Costumers, pretty view
  def formatted_total_costumers
    self.total_costumers.to_s.to_int_formatter
  end

  # Formatted Total Costumers, pretty view
  def formatted_total_money
    self.total_money.to_s.to_currency_formatter
  end


  # Currency Formatters
  def formatted_total_expense
    self.total_expense.to_s.to_currency_formatter
  end

  def formatted_total_revenue
    self.total_revenue.to_s.to_currency_formatter
  end

  def formatted_price
    self.price.to_s.to_currency_formatter
  end

  # Percent amounts
  def formatted_market_penetration
    self.market_penetration.to_s.to_percent_formatter
  end
end