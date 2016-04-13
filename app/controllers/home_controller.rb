class HomeController < ApplicationController
  layout 'creative_landing'

  def index
  end

  def methodology
  end

  protected
    def login_not_required
      true
    end
end
