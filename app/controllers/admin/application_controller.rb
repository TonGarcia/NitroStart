# -*- encoding : utf-8 -*-
# Provides a base class for Admin controllers to subclass
#
# Automatically sets the layout and ensures an administrator is logged in
class Admin::ApplicationController < ApplicationController
  #include TheRole::Controller

  protect_from_forgery

  before_action :login_required
  before_action :role_required

  def access_denied
    flash[:error] = t('the_role.access_denied')
    redirect_to root_url
  end
end
