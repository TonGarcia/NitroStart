class Idea < ActiveRecord::Base
  # Concerns Dependencies
  include WidgetTracker

  # Relations
  belongs_to :pitch
  belongs_to :start_up

  # Rails validations
  validates :main_problem, length: { minimum: 2, maximum: 75 }, presence: true
  validates :second_problems, length: { minimum: 2, maximum: 255 }, allow_blank: true
  validates :current_solution, length: { minimum: 2, maximum: 140 }, allow_blank: true
  validates :tag_line_pitch, length: { minimum: 2, maximum: 75 }, allow_blank: true
  validates :high_concept_pitch, length: { minimum: 2, maximum: 50 }, allow_blank: true
  validates :how_validate, length: { minimum: 2, maximum: 140 }, allow_blank: true
end
