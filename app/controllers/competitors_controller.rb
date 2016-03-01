class CompetitorsController < ApplicationController
  # Controllers Concerns
  include HistoricalControllers

  #  Event Triggers
  before_action :set_competitor, only: [:show, :edit, :update, :destroy]

  # GET /competitors
  # GET /competitors.json
  def index
    @competitors = @pitch.competitors
  end

  # GET /competitors/1
  # GET /competitors/1.json
  def show
  end

  # GET /competitors/new
  def new
    @competitor = Competitor.new
  end

  # GET /competitors/1/edit
  def edit
  end

  # POST /competitors
  # POST /competitors.json
  def create
    @competitor = Competitor.new(competitor_params)

    respond_to do |format|
      if @competitor.save
        format.html { redirect_to [@pitch, @competitor], notice: 'Concorrente cadastrado com sucesso.' }
        format.json { render :show, status: :created, location: @competitor }
      else
        format.html { render :new }
        format.json { render json: @competitor.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /competitors/1
  # PATCH/PUT /competitors/1.json
  def update
    respond_to do |format|
      if @competitor.update(competitor_params)
        format.html { redirect_to [@pitch, @competitor], notice: 'Concorrente atualizado com sucesso.' }
        format.json { render :show, status: :ok, location: @competitor }
      else
        format.html { render :edit }
        format.json { render json: @competitor.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /competitors/1
  # DELETE /competitors/1.json
  def destroy
    @competitor.destroy
    respond_to do |format|
      format.html { redirect_to competitors_url, notice: 'Concorrente deletado com sucesso.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_competitor
      @competitor = Competitor.find(params[:id])
      @current_obj = @competitor
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def competitor_params
      base_params = params.require(:competitor).permit(:name, :price, :total_revenue, :total_customers, :bad_stories, :success_stories, :your_advantage)

      # un-format currency
      base_params[:price] = base_params[:price].currency_to_non_formatted_int if base_params[:price]
      base_params[:total_revenue] = base_params[:total_revenue].currency_to_non_formatted_int if base_params[:total_revenue]

      # un-format int
      base_params[:total_customers] = base_params[:total_customers].currency_to_non_formatted_int if base_params[:total_customers]

      base_params.merge!(pitch_id: params[:pitch_id])
    end
end
