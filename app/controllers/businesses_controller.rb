class BusinessesController < ApplicationController
  # Controllers Concerns
  include HistoricalControllers
  add_breadcrumb I18n.t('actions.businesses.index'), :pitch_businesses_path, only: %w(edit)

  #  Event Triggers
  before_action :set_business, only: [:show, :edit, :update, :destroy]

  # GET /businesses
  # GET /businesses.json
  def index
    @businesses = @pitch.businesses
  end

  # GET /businesses/1
  # GET /businesses/1.json
  def show
  end

  # GET /businesses/new
  def new
    @business = Business.new
  end

  # GET /businesses/1/edit
  def edit
  end

  # POST /businesses
  # POST /businesses.json
  def create
    @business = Business.new(business_params)

    respond_to do |format|
      if @business.save
        format.html { redirect_to [@pitch, @business], notice: 'Modelo de Negócio salvo com sucesso.' }
        format.json { render :show, status: :created, location: @business }
      else
        format.html { render :new }
        format.json { render json: @business.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /businesses/1
  # PATCH/PUT /businesses/1.json
  def update
    respond_to do |format|
      if @business.update(business_params)
        format.html { redirect_to [@pitch, @business], notice: 'Modelo de Negócio Atualizado com Sucesso!' }
        format.json { render :show, status: :ok, location: @business }
      else
        format.html { render :edit }
        format.json { render json: @business.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /businesses/1
  # DELETE /businesses/1.json
  def destroy
    @business.destroy
    respond_to do |format|
      format.html { redirect_to @pitch, notice: 'Modelo de Negócio deletado com sucesso.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_business
      @business = Business.find(params[:id])
      @current_obj = @business
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def business_params
      base_params = params.require(:business).permit(:partnerships, :value_proposition, :main_product_price, :revenue_model, :advantages, :disadvantages, :customer_success_stories)
      base_params.merge!(pitch_id: params[:pitch_id])
    end
end