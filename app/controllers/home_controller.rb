class HomeController < ApplicationController
  layout 'landing_page'

  def partners
  end

  def startupers
  end

  def angel_investor
  end

  def amateur_investor
  end

  protected
    def login_not_required
      true
    end
end
