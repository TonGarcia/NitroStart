module HomeHelper
  # Must return it product name
  def product_name
    'Predoo'
  end

  # Must return it app name based on user locale (default is pt-BR)
  def app_name
    'Nitro Start'
  end

  # Must return it app slogan phrase based on user locale (default is pt-BR)
  def slogan
    'energia que contagia!'
  end

  # Return it app_name with it slogan
  def app_name_slogan
    "#{app_name}, #{slogan}"
  end

  def app_footer_description
    slogan
  end

  def company_footer_description
    'Predoo - Copyright© & Registered® 2015 - Todos os direitos reservados.'
  end
end
