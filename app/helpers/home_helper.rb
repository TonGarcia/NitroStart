module HomeHelper
  # Must return it product name
  def product_name
    'NITRO START'
  end

  # Must return it app name based on user locale (default is pt-BR)
  def app_name
    'NITRO START'
  end

  # Must return it app slogan phrase based on user locale (default is pt-BR)
  def slogan
    'Investimentos mais simples, rentáveis e seguros.'
  end

  # Return it app_name with it slogan
  def app_name_slogan
    "#{app_name} - #{slogan}"
  end

  def app_footer_description
    "#{app_name} - #{slogan}"
  end

  def company_footer_description
    'Copyright© & Registered® 2016.'
  end
end
