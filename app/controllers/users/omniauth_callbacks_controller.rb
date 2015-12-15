class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  skip_before_filter :authenticate_user!

  def all
    user = Helpers::OAuth.from_omniauth(env['omniauth.auth'], current_user)
    session['user_id'] = user.id if user.id

    if user.persisted?
      flash[:notice] = 'You are now connected, enjoy!'
      sign_in_and_redirect(user)
    else
      if session['user_id']
        user = User.find session['user_id']
        return sign_in_and_redirect(user)
      end

      session['devise.user_attributes'] = user.attributes
      redirect_to new_user_registration_url
    end
  end

  def failure
    #handle you logic here..
    #and delegate to super.
    super
  end

  # Alias for the actions call
  alias_method :github, :all
  alias_method :twitter, :all
  alias_method :linkedin, :all
  alias_method :facebook, :all
  alias_method :passthru, :all
  alias_method :instagram, :all
  alias_method :google_oauth2, :all
end