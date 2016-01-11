class String
  def currency_to_non_formatted_int
    self.remove('.').sub(',', '.')
  end

  def to_non_formatted_int
    self.remove('.')
  end
end