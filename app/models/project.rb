class Project < ActiveRecord::Base
  # Concerns Dependencies
  include WidgetTracker

  # Relations
  belongs_to :pitch
  belongs_to :start_up

  # Rails validations
  validates :stage, inclusion: { in: 0..10 }, numericality: true, presence: true

  # Association validations
  validates_presence_of :pitch

  #  View Stage Attribute
  def view_stage
    ENUM[:start_up_stages][self.stage][:name]
  end
end