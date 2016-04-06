# Capability Formatter methods
module Formatter
  extend ActiveSupport::Concern

  # Int Formatters
  def formatted_total_users
    self.total_users.to_s.to_int_formatter
  end

  # Formatted Total customers, pretty view
  def formatted_total_customers
    self.total_customers.to_s.to_int_formatter
  end

  def formatted_amount_daily_lead
    self.amount_daily_lead.to_s.to_int_formatter
  end

  def formatted_daily_growth_rate
    self.daily_growth_rate.to_s.to_int_formatter
  end

  # Formatted Total customers, pretty view
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
    self.your_advantage.raw_lines
  end

  def formatted_advantages
    self.advantages.raw_lines
  end

  def formatted_disadvantages
    self.disadvantages.raw_lines
  end

  def formatted_counterpart
    self.counterpart.raw_lines
  end

  def formatted_provides
    self.provides.raw_lines
  end

  def formatted_customer_specification
    self.customer_specification.raw_lines
  end

  def formatted_success_stories
    self.success_stories.raw_lines
  end

  def formatted_bad_stories
    self.bad_stories.raw_lines
  end

  def formatted_second_problems
    self.second_problems.raw_lines
  end

  def formatted_source_customer
    self.customers_source_link.to_link
  end

  def formatted_source_money
    self.money_source_link.to_link
  end

  def formatted_locale
    I18n.t "idioms.#{self.locale}"
  end

  def formatted_inner_link
    "#{Helpers::StaticConfigs.host}/#{self.permalink}"
  end

  def permissions_sym
    self.permissions.to_sym
  end

  def custom_draft
    self.draft ? '<span class="red-text">Rascunho</span>' : '<span class="green-text">Ativo</span>'
  end
end