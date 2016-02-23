class StartUp < ActiveRecord::Base
  # Concerns Dependencies
  include TeammatesAssociations
  include HistoricalTrackable

  # Relations
  belongs_to :pitch
end