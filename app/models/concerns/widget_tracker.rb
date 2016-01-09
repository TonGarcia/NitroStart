# Easy Trackable objects functions
module WidgetTracker
  extend ActiveSupport::Concern

  # Return the attributes percent filled
  def amount_filled
    # SetUp vars
    filled_attrs = 0
    full_percent = 100
    attrs = attrs_that_matters
    attr_keys = attrs.keys
    attrs_amount = attrs.length

    # Check filled attrs
    attr_keys.each do |attr_key|
      attrs[attr_key].blank? ? next : filled_attrs = filled_attrs+1
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

  # Return only the useful attrs, removing logical attributes
  def attrs_that_matters
    self.attributes.except('id', 'currency_iso',  'active', 'pitch_id', 'start_up_id', 'created_at', 'updated_at')
  end
end