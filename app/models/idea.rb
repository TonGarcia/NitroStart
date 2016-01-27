class Idea < ActiveRecord::Base
  # Concerns Dependencies
  include WidgetTracker

  # Relations
  belongs_to :pitch
  belongs_to :start_up

  # Rails validations (Must be Present)
  validates :main_problem, length: { minimum: 10, maximum: 75 }, presence: true
  validates :why_must_success, length: { minimum: 10, maximum: 140 }, presence: true

  # Rails validations (AllowBlank)
  validates :how_validate, length: { minimum: 10, maximum: 140 }, allow_blank: true
  validates :tag_line_pitch, length: { minimum: 10, maximum: 80 }, allow_blank: true
  validates :second_problems, length: { minimum: 10, maximum: 255 }, allow_blank: true
  validates :current_solution, length: { minimum: 5, maximum: 140 }, allow_blank: true
  validates :high_concept_pitch, length: { minimum: 10, maximum: 50 }, allow_blank: true
end