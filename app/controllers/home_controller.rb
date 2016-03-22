class HomeController < ApplicationController
  layout 'landing_page'

  def index
  end

  def startupers_landing
  end

  protected
    def login_not_required
      true
    end
end
