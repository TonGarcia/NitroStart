class Traction < ActiveRecord::Base
  # Concerns Dependencies
  include WidgetTracker

  # Relations
  belongs_to :pitch
  belongs_to :start_up

  # Rails validations
  validates :grow_strategy, length: { minimum: 2, maximum: 140 }, presence: true
  validates :costumer_channels, length: { minimum: 2, maximum: 140 }, presence: true

  # Formatted Total Costumers, pretty view
  def formatted_daily_growth_rate
    Helpers::Formatter.int_formatter self.daily_growth_rate
  end

  # Formatted Total Costumers, pretty view
  def formatted_conversion_cust
    Helpers::Formatter.currency_formatter self.conversion_cust
  end
end