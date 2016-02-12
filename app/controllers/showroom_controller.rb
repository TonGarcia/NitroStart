class ShowroomController < ApplicationController
  # GET /:permalink
  # Show specific PITCH or STARTUP based on it defined permalink
  def show
    @campaign = Campaign.where(link: params[:permalink]).take
    # TODO if @campaign.nil throw 404 error

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
end
