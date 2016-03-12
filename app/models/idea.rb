class Idea < ActiveRecord::Base
  # Concerns Dependencies
  include Formatter
  include WidgetTracker

  # Relations
  belongs_to :pitch

  # Rails validations (Must be Present)
  validates :main_problem, length: { minimum: 10, maximum: 90 }, presence: true
  validates :why_must_success, length: { minimum: 10, maximum: 140 }, presence: true

  # Rails validations (AllowBlank)
  validates :how_validate, length: { minimum: 10, maximum: 140 }, allow_blank: true
  validates :tag_line_pitch, length: { minimum: 10, maximum: 75 }, allow_blank: true
  validates :second_problems, length: { minimum: 10, maximum: 400 }, allow_blank: true
  validates :current_solution, length: { minimum: 5, maximum: 140 }, allow_blank: true
  validates :high_concept_pitch, length: { minimum: 10, maximum: 75 }, allow_blank: true

  # Validate Association
  validates_presence_of :pitch_id
end