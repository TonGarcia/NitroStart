module HistoricalTrackable
  extend ActiveSupport::Concern

  # Return the single active for Tracking
  # TODO when active is enable
  # self.send(associations).where(active:true).take
  def active(association)
    association_str = association.to_s
    associations = association_str.pluralize
    associated = self.send(associations).last
    associated.nil? ? association_str.humanize.singularize.constantize.new : associated
  end
end