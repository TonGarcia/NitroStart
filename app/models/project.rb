class Project < ActiveRecord::Base
  # Concerns Dependencies
  include Avatar
  include WidgetTracker

  # Relations
  belongs_to :pitch
  belongs_to :start_up

  # Rails validations
  validates :stage, inclusion: { in: 0..10 }, presence: true

  #  View Stage Attribute
  def view_stage
    ENUM[:start_up_stages].each {|stage| return stage[:name] if stage[:id] == self.stage}
  end

  def stage_sym
    index_dif = 1
    ENUM[:start_up_stages][self.stage-index_dif][:sym].to_sym
  end
end