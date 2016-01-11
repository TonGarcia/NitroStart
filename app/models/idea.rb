class Idea < ActiveRecord::Base
  # Concerns Dependencies
  include WidgetTracker

  # Relations
  belongs_to :pitch
  belongs_to :start_up

  # Rails validations
  validates :main_problem, length: { minimum: 2, maximum: 55 }
  validates :second_problems, length: { minimum: 2, maximum: 255 }, if: :second_problems
  validates :current_solution, length: { minimum: 2, maximum: 140 }, if: :current_solution
  validates :tag_line_pitch, length: { minimum: 2, maximum: 75 }, if: :tag_line_pitch
  validates :high_concept_pitch, length: { minimum: 2, maximum: 50 }, if: :high_concept_pitch
  validates :how_validate, length: { minimum: 2, maximum: 140 }, if: :how_validate
end
