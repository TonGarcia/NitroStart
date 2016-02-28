class StartUp < ActiveRecord::Base
  # Concerns Dependencies
  include TeammatesAssociations
  include HistoricalTrackable

  # Relations
  has_many :pitches, through: :startup_pitches
end