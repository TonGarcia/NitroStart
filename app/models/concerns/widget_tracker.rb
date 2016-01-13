# Easy Trackable objects functions
module WidgetTracker
  extend ActiveSupport::Concern

  # Dynamic validate belongs_to validation
  included do
    validate :at_least_one_association
  end

  # Return the attributes percent filled
  def amount_filled(type=nil)
    # SetUp vars
    filled_attrs = 0
    full_percent = 100
    attrs = attrs_that_matters
    attr_keys = attrs.keys
    attrs_amount = attrs.length

    # Check filled attrs
    attr_keys.each do |attr_key|
      filled_attrs = filled_attrs+1 if attrs[attr_key] == false
      next if attrs[attr_key].is_a?(Numeric) && attrs[attr_key] <= 0
      attrs[attr_key].blank? ? next : filled_attrs = filled_attrs+1
    end

    return filled_attrs if type == :filled_amount
    "#{filled_attrs*full_percent/attrs_amount}%"
  end

  # Return only the useful attrs, removing logical attributes
  def attrs_that_matters
    self.attributes.except('id', 'awards', 'patent', 'currency_iso',  'active', 'pitch_id', 'start_up_id', 'created_at', 'updated_at')
  end

  # Prevent to persist it without at least 1 ref
  def at_least_one_association
    raise ActiveRecord::Rollback if self.pitch_id.nil? && self.start_up_id.nil?
  end
end