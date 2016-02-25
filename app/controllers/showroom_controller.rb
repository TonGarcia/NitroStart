class ShowroomController < ApplicationController
  # GET /:permalink
  # Show specific PITCH or STARTUP based on it defined permalink
  def show
    # Base check/search it campaign
    @campaign = Campaign.where(link: params[:permalink]).take
    redirect_to file_not_found_path if @campaign.nil?

    # Setup view variables
    @dynamic_title = @campaign.nested_obj.name

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