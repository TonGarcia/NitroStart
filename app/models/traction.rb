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
end