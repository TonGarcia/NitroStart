class StartUp < ActiveRecord::Base
  # Concerns Dependencies
  include HistoricalTrackable

  # Relations
  belongs_to :pitch
end