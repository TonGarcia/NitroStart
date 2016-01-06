class HomeController < ApplicationController
  layout 'landing_page'

  def index
  end

  def partners
  end

  def startupers
  end

  def landing2
  end

  protected
    def login_not_required
      true
    end
end
