class ShowroomController < ApplicationController
  # Track it visitor before perform the requested action
  include CampaignSetups

  # GET /:permalink
  # Show specific PITCH or STARTUP based on it defined permalink
  def show
    # Define it layout
    self.class.layout 'dynamic'
  end

  # GET /showroom/pitches
  # List Pitches receiving Supporter Likes
  def pitches
    @pitches = Campaign.where
  end

  # GET /showroom/startups
  # List Startups receiving investments
  def startups
  end

  protected
    # Every controller which doesn't need session, like API, must change it
    def login_not_required
      setup_user unless session["warden.user.user.key"].nil?
      true
    end
end