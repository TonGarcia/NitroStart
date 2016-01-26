class MarketsController < ApplicationController
  # Controllers Concerns
  include HistoricalControllers

  #  Event Triggers
  before_action :set_market, only: [:show, :edit, :update, :destroy]

  # GET /markets
  # GET /markets.json
  def index
    @markets = @nested_obj.markets
  end

  # GET /markets/1
  # GET /markets/1.json
  def show
  end

  # GET /markets/new
  def new
    @market = Market.new
  end

  # GET /markets/1/edit
  def edit
  end

  # POST /markets
  # POST /markets.json
  def create
    @market = Market.new(market_params)

    respond_to do |format|
      if @market.save
        format.html { redirect_to [@nested_obj, @market], notice: 'Mercado foi criado com sucesso.' }
        format.json { render :show, status: :created, location: @market }
      else
        format.html { render :new }
        format.json { render json: @market.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /markets/1
  # PATCH/PUT /markets/1.json
  def update
    respond_to do |format|
      if @market.update(market_params)
        format.html { redirect_to [@nested_obj, @market], notice: 'Mercado foi atualizado com sucesso.' }
        format.json { render :show, status: :ok, location: @market }
      else
        format.html { render :edit }
        format.json { render json: @market.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /markets/1
  # DELETE /markets/1.json
  def destroy
    @market.destroy
    respond_to do |format|
      format.html { redirect_to markets_url, notice: 'Mercado foi deletado com sucesso.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_market
      @market = Market.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def market_params
      permitted_params = params.require(:market).permit(:segment, :total_costumers, :costumers_source_link, :total_money, :money_source_link, :trends_insight, :costumer_specification)
      permitted_params.merge!(pitch_id: params[:pitch_id], start_up_id: params[:start_up_id])

      # String to int
      permitted_params[:total_money] = permitted_params[:total_money].currency_to_non_formatted_int if permitted_params[:total_money]
      permitted_params[:total_costumers] = permitted_params[:total_costumers].to_non_formatted_int if permitted_params[:total_costumers]

      permitted_params
    end
end