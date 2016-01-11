class String
  def currency_to_non_formatted_int
    self.remove('.').remove(',00')
  end

  def to_non_formatted_int
    self.remove('.')
  end
end