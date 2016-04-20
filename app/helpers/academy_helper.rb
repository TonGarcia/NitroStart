module AcademyHelper
  def academy_url(path=nil)
    "http://academy.nitrostart.me/#{path}"
  end

  def c_levels_url
    academy_url('c-levels-governanca-nitro-venture-builder')
  end

  def hypotheses_url
    academy_url('como-levantar-validar-hipoteses-de-necessidades-de-mercado')
  end

  def customer_crowdfunding_url
    academy_url('customer-crowdfunding-financiamento-coletivo-pelos-consumidores')
  end
end