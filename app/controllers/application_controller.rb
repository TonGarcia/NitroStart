class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  layout 'card'
  respond_to :html, :json
  protect_from_forgery with: :exception
  before_action :setup_user, unless: :login_not_required
  before_action :configure_permitted_parameters, if: :devise_controller?
  add_breadcrumb '<i class="fa fa-home"></i> Início'.html_safe, '/'

  # 404 Rendered
  def not_found
    raise ActionController::RoutingError.new('Not Found')
  end

  protected
    # Config devise params
    def configure_permitted_parameters
      devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:locale, :name, :email, :password, :password_confirmation, :remember_me) }
      devise_parameter_sanitizer.for(:sign_in) { |u| u.permit(:login, :email, :password, :remember_me) }
      devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:password, :password_confirmation, :current_password) }
      @current_user = current_user unless @current_user
    end

    # Call the Authenticate & set it @current_user up
    def setup_user
      current_user.nil? ? authenticate_user! : @current_user = current_user
    end

    # Create the breadcrumbs
    def setup_breadcrumbs
      add_breadcrumb '<i class="fa fa-home"></i> Início'.html_safe, '/'
      add_breadcrumb I18n.t("actions.#{params[:controller]}.#{params[:action]}"), request.fullpath, only: :"#{params[:action]}"
    end

    # Every controller which doesn't need session, like API, must change it
    def login_not_required
      false
    end

  private
    # Overwriting the sign_out redirect path method
    def after_sign_out_path_for(resource_or_scope)
      "#{new_user_session_path}"
    end
end