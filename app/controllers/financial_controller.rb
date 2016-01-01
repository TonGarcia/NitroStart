class FinancialController < ApplicationController
  before_action :set_financial, only: [:show, :edit, :update, :destroy]

  # GET /financial
  # GET /financial.json
  def index
    @financial = Financial.all
  end

  # GET /financial/1
  # GET /financial/1.json
  def show
  end

  # GET /financial/new
  def new
    @financial = Financial.new
  end

  # GET /financial/1/edit
  def edit
  end

  # POST /financial
  # POST /financial.json
  def create
    @financial = Financial.new(financial_params)

    respond_to do |format|
      if @financial.save
        format.html { redirect_to @financial, notice: 'Financial was successfully created.' }
        format.json { render :show, status: :created, location: @financial }
      else
        format.html { render :new }
        format.json { render json: @financial.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /financial/1
  # PATCH/PUT /financial/1.json
  def update
    respond_to do |format|
      if @financial.update(financial_params)
        format.html { redirect_to @financial, notice: 'Financial was successfully updated.' }
        format.json { render :show, status: :ok, location: @financial }
      else
        format.html { render :edit }
        format.json { render json: @financial.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /financial/1
  # DELETE /financial/1.json
  def destroy
    @financial.destroy
    respond_to do |format|
      format.html { redirect_to financial_url, notice: 'Financial was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_financial
      @financial = Financial.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def financial_params
      params.require(:financial).permit(:total_costumer, :total_revenue, :total_expense, :conversion_price, :market_penetration, :pitch_id, :start_up_id)
    end
end
