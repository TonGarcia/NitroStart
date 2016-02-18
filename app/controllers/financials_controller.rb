class FinancialsController < ApplicationController
  # Controllers Concerns
  include HistoricalControllers

  #  Event Triggers
  before_action :set_financial, only: [:show, :edit, :update, :destroy]

  # GET /financial
  # GET /financial.json
  def index
    @financials = @nested_obj.financials
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
        format.html { redirect_to [@nested_obj, @financial], notice: 'Financial was successfully created.' }
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
        format.html { redirect_to [@nested_obj, @financial], notice: 'Financial was successfully updated.' }
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
      format.html { redirect_to nested_index_url, notice: 'Financial was successfully destroyed.' }
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
      base_params = params.require(:financial).permit(:total_users, :total_customers, :total_revenue, :total_expense, :bootstrapped, :market_penetration)
      base_params.merge!(pitch_id: params[:pitch_id], start_up_id: params[:start_up_id])

      # un-format int
      base_params[:total_users] = base_params[:total_users].to_non_formatted_int if base_params[:total_users]
      base_params[:total_customers] = base_params[:total_customers].to_non_formatted_int if base_params[:total_customers]

      # un-format currency
      base_params[:total_revenue] = base_params[:total_revenue].currency_to_non_formatted_int if base_params[:total_revenue]
      base_params[:total_expense] = base_params[:total_expense].currency_to_non_formatted_int if base_params[:total_expense]
      base_params[:bootstrapped] = base_params[:bootstrapped].currency_to_non_formatted_int if base_params[:bootstrapped]

      base_params
    end
end
