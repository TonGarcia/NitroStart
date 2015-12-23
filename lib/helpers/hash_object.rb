module Helpers
  class HashObject
    def initialize(hash)
      # Dynamic part
      hash.each do |key, value|
        next unless key.to_s.index('[]').nil?
        self.class.__send__(:attr_accessor, :"#{key}")
        self.__send__("#{key}=", value)
      end
    end
  end
end