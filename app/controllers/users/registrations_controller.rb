class Users::RegistrationsController < Devise::RegistrationsController
  layout 'sign'

  protected
    def after_sign_up_path_for(resource)
      "#{new_user_session_path}?email=#{resource.email}"
    end

    def after_inactive_sign_up_path_for(resource)
      "#{new_user_session_path}?email=#{resource.email}"
    end

  private
    def set_nested
    end

    def validate_permission
    end
end