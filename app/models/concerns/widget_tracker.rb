# Easy Trackable objects functions
module WidgetTracker
  extend ActiveSupport::Concern

  # Return the attributes percent filled
  def amount_filled
    # SetUp vars
    filled_attrs = 0
    full_percent = 100
    attrs = self.attributes.keys
    attrs_amount = attrs.length

    # Check filled attrs
    attrs.each do |attr|
      attr.nil? ? filled_attrs = filled_attrs+1 : next
    end

    "#{filled_attrs*full_percent/attrs_amount}%"
  end

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