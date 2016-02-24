class ShowroomController < ApplicationController
  # GET /:permalink
  # Show specific PITCH or STARTUP based on it defined permalink
  def show
    @campaign = Campaign.where(link: params[:permalink]).take
    redirect_to file_not_found_path if @campaign.nil?
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
