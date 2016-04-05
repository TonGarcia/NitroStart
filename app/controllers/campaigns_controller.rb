class CampaignsController < ApplicationController
  # Controllers Concerns
  include CampaignSetups
  include HistoricalControllers

  #  Event Triggers
  before_action :set_campaign, only: [:show, :edit, :update, :destroy]

  # GET /campaigns
  # GET /campaigns.json
  def index
    @campaigns = @pitch.campaigns
  end

  # GET /campaigns/1
  # GET /campaigns/1.json
  def show
  end

  # GET /campaigns/new
  def new
    @campaign = Campaign.new
  end

  # GET /campaigns/1/edit
  def edit
  end

  # POST /campaigns
  # POST /campaigns.json
  def create
    @campaign = Campaign.new(campaign_params)

    respond_to do |format|
      if @campaign.save
        format.html { redirect_to [@pitch, @campaign], notice: 'Campanha criada com sucesso.' }
        format.json { render :show, status: :created, location: @campaign }
      else
        format.html { render :new }
        format.json { render json: @campaign.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /campaigns/1
  # PATCH/PUT /campaigns/1.json
  def update
    respond_to do |format|
      if @campaign.update(campaign_params)
        format.html { redirect_to [@pitch, @campaign], notice: 'Campanha atualizada com sucesso.' }
        format.json { render :show, status: :ok, location: @campaign }
      else
        format.html { render :edit }
        format.json { render json: @campaign.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /campaigns/1
  # DELETE /campaigns/1.json
  def destroy
    @campaign.destroy
    respond_to do |format|
      format.html { redirect_to @pitch, notice: 'Campanha deletada com sucesso.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_campaign
      @campaign = Campaign.find(params[:id])
      @current_obj = @campaign
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def campaign_params
      base_params = params.require(:campaign).permit(:idea_id, :permalink, :banner, :video, :draft, :locale, :body).merge!(pitch_id: params[:pitch_id])
      # TODO remove it when it comes global
      base_params[:locale] = 'pt'
      base_params
    end
end