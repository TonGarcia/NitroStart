module Helpers
  class Formatter
    def self.int_formatter(value)
      ApplicationController.helpers.number_with_delimiter(value, delimiter: '.')
    end

    def self.currency_formatter(value)
      ApplicationController.helpers.number_to_currency(value, unit: 'R$', separator: ',', delimiter: '.')
    end
  end
end