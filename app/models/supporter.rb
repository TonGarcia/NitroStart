class Supporter < ActiveRecord::Base
  # Concerns Dependencies
  include WidgetTracker

  # Relations
  belongs_to :user
  belongs_to :pitch
end
