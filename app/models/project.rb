class Project < ActiveRecord::Base
  # Concerns Dependencies
  include WidgetTracker

  # Attachments
  mount_uploader :work_flow, WorkFlowUploader

  # Relations
  belongs_to :pitch

  # Rails validations
  validates :stage, inclusion: { in: 0..10 }, presence: true
  validates :award_source, presence: true, length: { minimum: 10, maximum: 255 }, if: :awards?
  validates :patent_source, presence: true, length: { minimum: 10, maximum: 255 }, if: :patent?

  # Validate Association
  validates_presence_of :pitch_id

  #  View Stage Attribute
  def view_stage
    ENUM[:start_up_stages].each {|stage| return stage[:name] if stage[:id] == self.stage}
  end

  def stage_sym
    # Stages are IDs, so it starts on 1 not on 0, like arrays
    stages_extra_index = 1
    only_idea_stage_index = :idea
    return only_idea_stage_index if self.stage.nil?
    ENUM[:start_up_stages][self.stage-stages_extra_index][:sym].to_sym
  end
end