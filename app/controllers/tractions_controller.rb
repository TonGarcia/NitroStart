class TractionsController < ApplicationController
  before_action :set_traction, only: [:show, :edit, :update, :destroy]

  # GET /tractions
  # GET /tractions.json
  def index
    @tractions = Traction.all
  end

  # GET /tractions/1
  # GET /tractions/1.json
  def show
  end

  # GET /tractions/new
  def new
    @traction = Traction.new
  end

  # GET /tractions/1/edit
  def edit
  end

  # POST /tractions
  # POST /tractions.json
  def create
    @traction = Traction.new(traction_params)

    respond_to do |format|
      if @traction.save
        format.html { redirect_to @traction, notice: 'Traction was successfully created.' }
        format.json { render :show, status: :created, location: @traction }
      else
        format.html { render :new }
        format.json { render json: @traction.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tractions/1
  # PATCH/PUT /tractions/1.json
  def update
    respond_to do |format|
      if @traction.update(traction_params)
        format.html { redirect_to @traction, notice: 'Traction was successfully updated.' }
        format.json { render :show, status: :ok, location: @traction }
      else
        format.html { render :edit }
        format.json { render json: @traction.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tractions/1
  # DELETE /tractions/1.json
  def destroy
    @traction.destroy
    respond_to do |format|
      format.html { redirect_to tractions_url, notice: 'Traction was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_traction
      @traction = Traction.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def traction_params
      params.require(:traction).permit(:grow_strategy, :growth_rate, :market_meet_channel, :conversion_rate, :pitch_id, :start_up_id)
    end
end
