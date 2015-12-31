class TeammatesController < ApplicationController
  before_action :set_teammate, only: [:show, :edit, :update, :destroy]

  # GET /teammates
  # GET /teammates.json
  def index
    @teammates = Teammate.all
  end

  # GET /teammates/1
  # GET /teammates/1.json
  def show
  end

  # GET /teammates/new
  def new
    @teammate = Teammate.new
  end

  # GET /teammates/1/edit
  def edit
  end

  # POST /teammates
  # POST /teammates.json
  def create
    @teammate = Teammate.new(teammate_params)

    respond_to do |format|
      if @teammate.save
        format.html { redirect_to @teammate, notice: 'Teammate was successfully created.' }
        format.json { render :show, status: :created, location: @teammate }
      else
        format.html { render :new }
        format.json { render json: @teammate.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /teammates/1
  # PATCH/PUT /teammates/1.json
  def update
    respond_to do |format|
      if @teammate.update(teammate_params)
        format.html { redirect_to @teammate, notice: 'Teammate was successfully updated.' }
        format.json { render :show, status: :ok, location: @teammate }
      else
        format.html { render :edit }
        format.json { render json: @teammate.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /teammates/1
  # DELETE /teammates/1.json
  def destroy
    @teammate.destroy
    respond_to do |format|
      format.html { redirect_to teammates_url, notice: 'Teammate was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_teammate
      @teammate = Teammate.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def teammate_params
      params.require(:teammate).permit(:role, :expertise, :contacts, :team_id, :user_id)
    end
end
