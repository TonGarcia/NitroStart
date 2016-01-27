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

  def formatted_amount_daily_lead
    self.amount_daily_lead.to_s.to_int_formatter
  end

  def formatted_daily_growth_rate
    self.daily_growth_rate.to_s.to_int_formatter
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

  def formatted_bootstrapped
    self.bootstrapped.to_s.to_currency_formatter
  end

  def formatted_conversion_cust
    self.conversion_cust.to_s.to_currency_formatter
  end

  def formatted_lead_cust
    self.lead_cust.to_s.to_currency_formatter
  end

  # Percent amounts
  def formatted_market_penetration
    self.market_penetration.to_s.to_percent_formatter
  end

  def formatted_your_advantage
    self.your_advantage.gsub(/\n/, '<br/>')
  end

  def formatted_advantages
    self.advantages.gsub(/\n/, '<br/>')
  end

  def formatted_disadvantages
    self.disadvantages.gsub(/\n/, '<br/>')
  end

  def formatted_counterpart
    self.counterpart.gsub(/\n/, '<br/>')
  end

  def formatted_provides
    self.provides.gsub(/\n/, '<br/>')
  end

  def formatted_costumer_specification
    self.costumer_specification.gsub(/\n/, '<br/>')
  end

  def formatted_source_costumer
    self.costumers_source_link.to_link
  end

  def formatted_source_money
    self.money_source_link.to_link
  end
end