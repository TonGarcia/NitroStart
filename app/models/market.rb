class Market < ActiveRecord::Base
  # Concerns Dependencies
  include WidgetTracker

  # Relations
  belongs_to :pitch
  belongs_to :start_up

  # Rails validations
  validates :segment, length: { minimum: 2, maximum: 75 }, presence: true
  validates :currency_iso, numericality: true, inclusion: { in: 0..999 }, presence: true
  validates :total_money, numericality: { greater_than: 0 }, if: :total_money
  validates :total_costumers, numericality: { greater_than: 0 }, if: :total_costumers

  # Formatted Total Costumers, pretty view
  def formatted_total_costumers
    Helpers::Formatter.int_formatter self.total_costumers
  end

  # Formatted Total Costumers, pretty view
  def formatted_total_money
    Helpers::Formatter.currency_formatter self.total_money
  end
end