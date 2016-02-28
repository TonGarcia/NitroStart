class Traction < ActiveRecord::Base
  # Concerns Dependencies
  include Formatter
  include WidgetTracker

  # Relations
  belongs_to :pitch

  # Rails validations
  validates :grow_strategy, length: { minimum: 2, maximum: 140 }, presence: true
  validates :customer_channels, length: { minimum: 2, maximum: 140 }, presence: true

  # p2p attr association validations
  validates :lead_cust, numericality: true, presence: true
  validates :amount_daily_lead, numericality: true, presence: true
  validates :daily_growth_rate, numericality: true, presence: true
  validates :conversion_cust, numericality: true, presence: true

  # Validate Association
  validates_presence_of :pitch_id
end