class HomeController < ApplicationController
  layout 'landing_page'

  def index
  end

  protected
    def login_not_required
      true
    end
end
