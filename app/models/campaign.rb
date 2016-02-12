class Campaign < ActiveRecord::Base
  # Concerns Dependencies
  include WidgetTracker

  # Rails validations
  validates :link, length: { minimum: 3, maximum: 55 }, presence: true

  # Validate Association
  validates_presence_of :pitch_id, unless: :start_up_id
  validates_presence_of :start_up_id, unless: :pitch_id

  def canvas_type?
    self.active_type == 1
  end

  def body_type?
    self.active_type == 2
  end
end
