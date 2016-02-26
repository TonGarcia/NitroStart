class PitchesController < ApplicationController
  add_breadcrumb I18n.t('actions.pitches.index'), :pitches_path
  add_breadcrumb I18n.t('actions.pitches.show'), :pitch_path, only: %w(show)
  add_breadcrumb I18n.t('actions.pitches.new'), :new_pitch_path, only: %w(new)
  before_action :set_pitch, only: [:show, :edit, :update, :destroy]

  # View Helpers to Controller
  include TeammatesHelper

  # GET /pitches/1/campaign
  def campaign
    @pitch = Pitch.find(params[:pitch_id])
  end

  # GET /pitches
  # GET /pitches.json
  def index
    @pitches = @current_user.confirmed_team(:pitches)
  end

  # GET /pitches/1
  # GET /pitches/1.json
  def show
  end

  # GET /pitches/new
  def new
    @pitch = Pitch.new
  end

  # GET /pitches/1/edit
  def edit
  end

  # POST /pitches
  # POST /pitches.json
  def create
    @pitch = Pitch.new(pitch_params)

    respond_to do |format|
      if @pitch.save
        format.html { redirect_to @pitch, notice: 'Pitch criado com sucesso! Agora nos dê mais informações sobre seu Projeto!' }
        format.json { render :show, status: :created, location: @pitch }
      else
        format.html { render :new }
        format.json { render json: @pitch.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /pitches/1
  # PATCH/PUT /pitches/1.json
  def update
    respond_to do |format|
      if @pitch.update(pitch_params)
        format.html { redirect_to @pitch, notice: 'Pitch atualizado com sucesso! Continue alimentando-o com mais informações!' }
        format.json { render :show, status: :ok, location: @pitch }
      else
        format.html { render :edit }
        format.json { render json: @pitch.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pitches/1
  # DELETE /pitches/1.json
  def destroy
    @pitch.destroy
    respond_to do |format|
      format.html { redirect_to pitches_url, notice: 'Pitch destruído com sucesso.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pitch
      @pitch = @current_user.pitches.where(id: params[:id]).take
      @pitch = @current_user.pitches if @pitch.nil?
      redirect_to forbidden_path if @pitch.nil?
      @current_obj = @pitch
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def pitch_params
      params.require(:pitch).permit(:name, :avatar, :cover, :video_link).merge!(user_id: @current_user.id)
    end
end