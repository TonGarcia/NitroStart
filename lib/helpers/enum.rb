module Helpers
  # ShortCuts to access YMLs LIKE translate (i18/locales)
  class Enum
    @@withdraw_category=nil

    # Type: :brands, :currencies, :payment_methods, :recurrence_periods, :operators
    # KeyAttribute: :id, :name, :username...
    # Value: value on it attr (as Str, int...)
    def self.find(type, key, value=nil)
      key.is_a?(Array) ? Helpers::Enum.hash_to_obj(type, key) : Helpers::Enum.find_on_array(type, key, value)
    end

    # Search for a ENUM on array
    def self.find_on_array(type, key, value)
      # If simple just return based on the ID
      elements = ENUM[type]
      if key == :id
        value = value.to_i
        return elements[value]
      end

      if elements.is_a?Hash
        aux_elements= []
        elements.keys.each do |key|
          aux_elements.push elements[key]
        end

        elements = aux_elements
      end

      # Search for the element
      elements.each_with_index do |element, i|
        value = value.to_s if value.is_a?Symbol
        if element[key] == value
          element[:index] = i
          return element
        end
      end
    end

    # Return an Array
    def self.find_array(type, key, value)
      resp = []
      ENUM[type].each {|item| resp << Helpers::HashObject.new(item) if item[key] == value}
      resp
    end

    # Search for a ENUM on a hash based on it array structure
    def self.hash_to_obj(type, key)
      hash = ENUM[type]

      if key.is_a? Array
        new_hash = hash
        key.each do |k|
          new_hash = new_hash[k]
        end

        hash = new_hash
      elsif key.is_a?(String) || key.is_a?(Symbol)
        hash = hash[key]
      end

      Helpers::HashObject.new(hash)
    end

    # Return the internal alias for the external ref, like Rents alias for Cielo payment_method
    # example: external_ref = :cielo, attr = :payment_method, val = cielo[:'forma-pagamento'][:produto]
    # IF ID PASS IT USING .to_i
    def self.alias_adapter(external_ref=:cielo, attr, val)
      case external_ref
        when :cielo
          attrs = attr.to_s.pluralize.to_sym
          return ENUM[attrs] unless ENUM[attrs].is_a?(Array)
          ENUM[attrs].each {|current_attr| return current_attr if current_attr[:id]==val}
        else return {}
      end
    end

    # AccountDrive Hash obj
    def self.withdraw
      Helpers::Enum.find(:commission_categories, :name, :withdraw)
    end

    # WithdrawCategory
    def self.withdraw_category
      @@withdraw_category.nil? ? @@withdraw_category = Helpers::Enum.withdraw[:index] : @@withdraw_category
    end

    # Categories
    def self.apps_categories
      care = Helpers::Enum.find(:apps_categories, :name, 'care')[:id]
      income = Helpers::Enum.find(:apps_categories, :name, 'income')[:id]
      capitalization = Helpers::Enum.find(:apps_categories, :name, 'capitalization')[:id]
      {care:care, income:income, capitalization:capitalization}
    end

    # TransferenceCategory
    def self.transference_category
      Helpers::Enum.find(:commission_categories, :name, :transference)[:index]
    end
  end
end