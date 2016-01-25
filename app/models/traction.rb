class Traction < ActiveRecord::Base
  # Concerns Dependencies
  include Formatter
  include WidgetTracker

  # Relations
  belongs_to :pitch
  belongs_to :start_up

  # Rails validations
  validates :grow_strategy, length: { minimum: 2, maximum: 140 }, presence: true
  validates :costumer_channels, length: { minimum: 2, maximum: 140 }, presence: true

  # p2p attr association validations
  validates :lead_cust, numericality: { greater_than: 0 }, presence: true, if: :amount_daily_lead
  validates :amount_daily_lead, numericality: { greater_than: 0 }, presence: true, if: :lead_cust
  validates :daily_growth_rate, numericality: { greater_than: 0 }, presence: true, if: :conversion_cust
  validates :conversion_cust, numericality: { greater_than: 0 }, presence: true, if: :daily_growth_rate
end