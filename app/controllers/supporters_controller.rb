class SupportersController < ApplicationController
  #  Event Triggers
  before_action :set_nested
  before_action :set_supporter, only: [:show, :edit, :update, :destroy]

  # GET /supporters
  # GET /supporters.json
  def index
    @supporters = Supporter.all
  end

  # GET /supporters/1
  # GET /supporters/1.json
  def show
    render layout: 'card_without_aside'
  end

  # GET /supporters/new
  def new
    # setup objs
    @supporter = Supporter.new

    # Setup view variables
    @dynamic_title = @campaign.pitch.name

    # Define it layout
    self.class.layout 'dynamic'
  end

  # GET /supporters/1/edit
  def edit
  end

  # POST /supporters
  # POST /supporters.json
  def create
    @supporter = Supporter.new(supporter_params)

    respond_to do |format|
      if @supporter.save
        supporter_link = [@pitch, @campaign, @supporter]
        params[:commit].empty? ? action_destination = supporter_link : action_destination = "#{@campaign.checkout_page_link}?ref=#{@supporter.id}"
        format.html { redirect_to action_destination, notice: 'Apoio registrado com sucesso.' }
        format.json { render :show, status: :created, location: @supporter }
      else
        format.html { render :new }
        format.json { render json: @supporter.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /supporters/1
  # PATCH/PUT /supporters/1.json
  def update
    respond_to do |format|
      if @supporter.update(supporter_params)
        format.html { redirect_to [@pitch, @supporter], notice: 'Apoio atualizado com Sucesso!' }
        format.json { render :show, status: :ok, location:                            @supporter }
      else
        format.html { render :edit }
        format.json { render json: @supporter.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /supporters/1
  # DELETE /supporters/1.json
  def destroy
    @supporter.destroy
    respond_to do |format|
      format.html { redirect_to @pitch, notice: 'Apoio removido com sucesso.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_supporter
      @supporter = Supporter.find(params[:id])
      @current_obj = @supporter
    end

    def set_nested
      @pitch = Pitch.find(params[:pitch_id]) if params[:pitch_id]
      @campaign = Campaign.find(params[:campaign_id]) if params[:campaign_id]
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def supporter_params
      # Base Supporter attributes
      base_params = params.require(:supporter).permit(:feedback_type, :how_much_pays, :positive_feedback, :negative_feedback)

      # Format it amount
      base_params[:how_much_pays] = BigDecimal.new(NitroPay::Currency.to_operator_str(base_params[:how_much_pays]))/100

      # Add it association keys
      @current_user ? user_id = @current_user.id : user_id = nil
      base_params.merge!(pitch_id: params[:pitch_id], user_id: user_id, campaign_id: params[:campaign_id])
    end
end