class Competitor < ActiveRecord::Base
  # Concerns Dependencies
  include Formatter
  include WidgetTracker

  # Relations
  belongs_to :pitch

  # Rails Validations
  validates :name, presence: true, length: { minimum: 2, maximum: 55 }
  validates :your_advantage, presence: true, length: { minimum: 3, maximum: 255 }

  # Validate Association
  validates_presence_of :pitch_id
end