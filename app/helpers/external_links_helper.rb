module ExternalLinksHelper
  def rents_url
    'http://jobs.rents.com.br'
  end

  def face_oauth_url
    user_omniauth_authorize_path('facebook')
  end
end