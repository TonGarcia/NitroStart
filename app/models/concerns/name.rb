# Capability name helper methods
module Name
  extend ActiveSupport::Concern

  # return it last name on composite name
  def last_name
    self.name.split(' ').last
  end

  # return it first name on composite name
  def first_name
    self.name.split(' ').first
  end

  # return it name as an array
  def names
    self.name.split(' ')
  end

  # validate full name format
  def full_name_format
    valid_full_name = true

    if !self.name.nil?
      # Must contains white space
      valid_full_name = false if (/^(.*\s+.*)+$/i =~ self.name).nil?
      # Must be alpha
      valid_full_name = false if(/^[A-Z]+$/i =~ self.name.remove(' ')).nil?
    else
      valid_full_name = false
    end

    if !valid_full_name
      self.errors.add(:name, 'deve ser Completo')
      raise ActiveRecord::Rollback
    end
  end
end