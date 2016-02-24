class TeammatesController < ApplicationController
  # Controllers Concerns
  include HistoricalControllers

  #  Event Triggers
  before_action :set_teammate, only: [:show, :edit, :update, :destroy]

  # GET /teammates/1/confirm_invitation
  # GET /teammates/1/confirm_invitation.json
  def confirm_invitation
    if params[:confirmation] == 'accepted'
      redirect_to nested_path_to(@teammate), flash: { notice: 'Bem-vindo ao Time de Tripulantes!' }
    elsif params[:confirmation] == 'declined'
      redirect_to root_path, flash: { notice: 'Convite Rejeitado com Sucesso.' }
    end
  end

  # GET /teammates
  # GET /teammates.json
  def index
    @teammates = @nested_obj.teammates
  end

  # GET /teammates/1
  # GET /teammates/1.json
  def show
    redirect_to nested_path_to(@teammate)
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
        format.html { redirect_to nested_path_to(@teammate), notice: "Um pedido de confirmação foi enviado para #{@teammate.user.name}" }
        format.json { render :show, status: :created, location: [@nested_obj, @teammate] }
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
        format.html { redirect_to nested_path_to(@teammate), notice: "O Tripulante #{@teammate.user.name} foi atualizado." }
        format.json { render :show, status: :ok, location: [@nested_obj, @teammate] }
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
      format.html { redirect_to nested_path_to(@teammate), notice: "O Tripulante #{@teammate.user.name} foi removido e será notificado." }
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
      base_params = params.require(:teammate).permit(:role, :permissions)
      base_params[:permissions] == '1' ? base_params[:permissions] = 'admin' : base_params[:permissions] = 'none'
      base_params.merge!(user_hash_id: params[:user_id], pitch_id: params[:pitch_id], start_up_id: params[:start_up_id])
    end
end