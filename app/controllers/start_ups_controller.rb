class StartUpsController < ApplicationController
  before_action :set_start_up, only: [:show, :edit, :update, :destroy]

  # GET /start_ups
  # GET /start_ups.json
  def index
    @start_ups = StartUp.all
  end

  # GET /start_ups/1
  # GET /start_ups/1.json
  def show
  end

  # GET /start_ups/new
  def new
    @start_up = StartUp.new
  end

  # GET /start_ups/1/edit
  def edit
  end

  # POST /start_ups
  # POST /start_ups.json
  def create
    @start_up = StartUp.new(start_up_params)

    respond_to do |format|
      if @start_up.save
        format.html { redirect_to @start_up, notice: 'Start up was successfully created.' }
        format.json { render :show, status: :created, location: @start_up }
      else
        format.html { render :new }
        format.json { render json: @start_up.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /start_ups/1
  # PATCH/PUT /start_ups/1.json
  def update
    respond_to do |format|
      if @start_up.update(start_up_params)
        format.html { redirect_to @start_up, notice: 'Start up was successfully updated.' }
        format.json { render :show, status: :ok, location: @start_up }
      else
        format.html { render :edit }
        format.json { render json: @start_up.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /start_ups/1
  # DELETE /start_ups/1.json
  def destroy
    @start_up.destroy
    respond_to do |format|
      format.html { redirect_to start_ups_url, notice: 'Start up was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_start_up
      @start_up = StartUp.find(params[:id])
      @current_obj = @start_up
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def start_up_params
      params.require(:start_up).permit(:name, :brand, :pitch_id)
    end
end
