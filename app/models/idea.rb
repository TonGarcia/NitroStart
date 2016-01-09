class Idea < ActiveRecord::Base
  # Concerns Dependencies
  include WidgetTracker

  # Relations
  belongs_to :pitch
  belongs_to :start_up

  # Rails validations
  validates :main_problem, length: { minimum: 2, maximum: 55 }

  # Association validations
  validates_presence_of :pitch
end
