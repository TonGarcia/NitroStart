class Financial < ActiveRecord::Base
  # Concerns Dependencies
  include Formatter
  include WidgetTracker

  # Relations
  belongs_to :pitch

  # Rails Validation
  validates :total_users, presence: true, numericality: { greater_than: 0 }
  validates :bootstrapped, presence: true, numericality: { greater_than: 0 }, allow_blank: true
  validates :total_customers, presence: true, numericality: { greater_than: 0 }, allow_blank: true
  validates :market_penetration, presence: true, numericality: { in: 0..100 }, allow_blank: true

  # Validate Association
  validates_presence_of :pitch_id
end