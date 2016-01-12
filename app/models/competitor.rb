class Competitor < ActiveRecord::Base
  # Concerns Dependencies
  include WidgetTracker

  # Relations
  belongs_to :pitch
  belongs_to :start_up

  # Rails Validations
  validates :name, presence: true, length: { minimum: 2, maximum: 55 }
  validates :your_advantage, presence: true, length: { minimum: 3, maximum: 255 }
end