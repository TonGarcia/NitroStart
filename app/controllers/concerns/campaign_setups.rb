# app/controllers/concerns/campaign_setups.rb
module CampaignSetups
  extend ActiveSupport::Concern

  included do
    before_action :set_bind_objs, except: [:index, :pitches, :startups]
  end

  def set_bind_objs
    # Prevent it setup if not a show action
    return if params[:action] != 'show' || params[:controller] != 'showroom'

    # Base check/search it campaign
    if params[:permalink]
      @campaign = Campaign.where(permalink: params[:permalink]).take
    elsif params[:id] && params[:controller] == 'campaigns'
      @campaign = Campaign.find(params[:id])
    end

    @active_idea = @campaign.pitch.active(:idea)
    redirect_to file_not_found_path if @campaign.nil?

    # Setup view variables
    @dynamic_title = @campaign.pitch.name
    @page_view_countries = @campaign.page_views.where.not(locale: nil).group(:locale)

    # Setup Objs
    @pitch = @campaign.pitch
  end
end