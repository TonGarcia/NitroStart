class Campaign < ActiveRecord::Base
  # Concerns Dependencies
  include WidgetTracker

  # Rails validations
  validates :link, length: { minimum: 3, maximum: 55 }, presence: true

  def canvas_type?
    self.active_type == 1
  end

  def body_type?
    self.active_type == 2
  end
end
