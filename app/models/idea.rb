class Idea < ActiveRecord::Base
  # Concerns Dependencies
  include WidgetTracker

  # Relations
  belongs_to :pitch

  # Rails validations
  validates :main_problem, length: { minimum: 2, maximum: 30 }, if: :main_problem

  # Association validations
  validates_presence_of :pitch
end
