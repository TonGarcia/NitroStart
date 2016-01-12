class Financial < ActiveRecord::Base
  # Concerns Dependencies
  include WidgetTracker

  # Relations
  belongs_to :pitch
  belongs_to :start_up

  # Rails Validation
  validates :total_user, presence: true, numericality: { greater_than: 0 }
  validates :total_costumer, presence: true, numericality: { in: 0..100 }, allow_blank: true
  validates :market_penetration, presence: true, numericality: { in: 0..100 }, allow_blank: true
end