class ErrorController < ApplicationController
# 404
  def file_not_found
    render file: 'public/404.html.slim.slim', status: :not_found, layout: layout_setup
  end

  # 422
  def unprocessable
    render file: 'public/422.html', status: :not_found, layout: layout_setup
  end

  # 500
  def internal_server_error
    render file: 'public/500.html', status: :not_found, layout: layout_setup
  end

  protected
    def login_not_required
      true
    end

  private
    def layout_setup
      current_user.nil? ? 'landing_page' : 'error'
    end
end
