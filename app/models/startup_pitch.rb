class StartupPitch < ActiveRecord::Base
  # Relations
  belongs_to :pitch
  belongs_to :start_up

  # Rails validations
  validates :active, inclusion: [true, false]

  # Association Validations
  validates_presence_of :pitch_id
  validates_presence_of :start_up_id
end