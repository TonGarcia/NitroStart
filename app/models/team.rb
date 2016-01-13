class Team < ActiveRecord::Base
  # Relations
  belongs_to :pitch
  belongs_to :start_up
end