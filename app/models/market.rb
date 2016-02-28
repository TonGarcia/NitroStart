class Market < ActiveRecord::Base
  # Concerns Dependencies
  include Formatter
  include WidgetTracker

  # Relations
  belongs_to :pitch

  # Rails validations
  validates :segment, length: { minimum: 2, maximum: 75 }, presence: true
  validates :currency_iso, numericality: true, inclusion: { in: 0..999 }, presence: true
  validates :total_money, numericality: { greater_than: 0 }, if: :total_money
  validates :total_customers, numericality: { greater_than: 0 }, if: :total_customers

  # Validate Association
  validates_presence_of :pitch_id
end