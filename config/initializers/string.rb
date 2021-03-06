class String
  def to_int_formatter
    Helpers::Formatter.int_formatter self
  end

  def to_currency_formatter
    Helpers::Formatter.currency_formatter self
  end

  def to_percent_formatter
    Helpers::Formatter.percent_formatter self
  end

  def currency_to_non_formatted_int
    self.remove('.').sub(',', '.')
  end

  def to_non_formatted_int
    self.remove('.')
  end

  def remove_formatter
    self.sub('formatted_', '')
  end

  def raw_lines
    self.gsub(/\n/, '<br/>')
  end

  def to_link
    Helpers::Formatter.link_formatter self
  end
end