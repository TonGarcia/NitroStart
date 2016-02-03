module ExternalLinksHelper
  def rents_url
    'http://jobs.rents.com.br'
  end

  def face_oauth_url
    user_omniauth_authorize_path('facebook')
  end

  def blog_startupers_landing_links
    [
        {href:'#', content: 'Entenda o que é Startup'},
        {href:'#', content: 'Entenda Co-Criação com Participação nos Lucros'},
        {href:'#', content: 'Descubra que Startup independe da Área de Atuação, Formação ou Tipo de Experiência Profissional'},
        {href:'#', content: 'Trabalhe no conforto da sua Casa ou em nossos Espaços de Co-Working (Sem Participação no Lucro)'},
    ]
  end

  def blog_investors_landing_links
    [
        {href:'#', content: 'Entenda o Co-Investimento'},
        {href:'#', content: 'Conheça o Investimento Anjo'},
        {href:'#', content: 'Conheça o Seguro NITRO para Investidores'},
        {href:'#', content: 'Entenda o Co-Investimento'},
    ]
  end
end