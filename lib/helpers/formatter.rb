module Helpers
  class Formatter
    def self.int_formatter(value)
      value = value.to_i unless value.is_a?Integer
      ApplicationController.helpers.number_with_delimiter(value, delimiter: '.')
    end

    def self.currency_formatter(value)
      value = value.to_f unless value.is_a?Numeric
      ApplicationController.helpers.number_to_currency(value, unit: 'R$', separator: ',', delimiter: '.')
    end

    def self.percent_formatter(value)
      value = value.to_f unless value.is_a?Numeric
      "#{ApplicationController.helpers.number_with_precision(value, precision: 2, delimiter: ',')}%"
    end

    def self.link_formatter(value)
      "<a href='#{value}' target='_blank'> #{value} </a>"
    end
  end
end