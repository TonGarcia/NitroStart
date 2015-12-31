class Competitor < ActiveRecord::Base
  belongs_to :pitch
  belongs_to :start_up
end
