class Business < ActiveRecord::Base
  # Concerns Dependencies
  include Formatter
  include WidgetTracker

  # Relations
  belongs_to :pitch

  # Rails validations
  validates :revenue_model, length: { minimum: 2, maximum: 255 }
end