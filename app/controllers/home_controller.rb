class HomeController < ApplicationController
  layout 'creative_landing'

  def index
  end

  def startupers_landing
  end

  protected
    def login_not_required
      true
    end
end
