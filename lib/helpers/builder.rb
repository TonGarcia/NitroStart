module Helpers
  # Helper to Build a type, like Hash from an Object
  class Builder
    # Return the hash from the user attrs based on what is permitted to be on the hash
    def self.hash(obj, permitted_attrs = [])
      obj_hash = {}
      obj_attrs = obj.attributes.deep_symbolize_keys
      permitted_attrs.each {|key| obj_hash[key] = obj_attrs[key]}

      obj_hash
    end

    # Return the obj hash without the passed attrs
    def self.hash_except obj, not_permitted_attrs = []
      hashed = obj.as_json.symbolize_keys
      not_permitted_attrs.each { |attr| hashed.delete attr }

      hashed
    end
  end
end