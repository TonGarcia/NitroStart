class TeammatesController < ApplicationController
  # Controllers Concerns
  include HistoricalControllers

  # View Helpers to Controller
  include TeammatesHelper

  #  Event Triggers
  before_action :set_teammate, only: [:show, :edit, :update, :destroy]

  # GET /teammates/1/resend_invitation
  # GET /teammates/1/resend_invitation.json
  def resend_invitation
    @teammate = Teammate.find(params[:teammate_id])
    current_user_is_the_owner = @current_user.id == @teammate.pitch.user_id
    return redirect_to forbidden_path unless current_user_is_the_owner

    @teammate.resend_invitation_email
    return redirect_to pitch_teammate_path(@pitch, @teammate), flash: { notice: "Convite re-enviado com sucesso para #{@teammate.user.name}" }
  end

  # GET /teammates/1/confirm_invitation
  # GET /teammates/1/confirm_invitation.json
  def confirm_invitation
    @teammate = Teammate.find(params[:teammate_id])
    return redirect_to forbidden_path unless @teammate.user_id == @current_user.id

    if params[:confirm] == 'accept'
      verified = @teammate.verify
      verified ? msg = 'Bem-vindo ao Time de Tripulantes!' : msg = 'Oops! Ocorreu um erro, tente novamente. Caso o erro persista peça para ser adicionado novamente ao time.'
      return redirect_to pitch_teammate_path(@pitch, @teammate), flash: { notice: msg }
    elsif params[:confirm] == 'decline'
      @teammate.destroy
      msg = "Convite do time #{@teammate.pitch.name} Rejeitado com Sucesso."
      return redirect_to root_path, flash: { notice: msg }
    end
  end

  # GET /teammates
  # GET /teammates.json
  def index
    @teammates = @pitch.teammates
  end

  # GET /teammates/1
  # GET /teammates/1.json
  def show
    redirect_to pitch_teammates_path @pitch
  end

  # GET /teammates/new
  def new
    redirect_to forbidden_path unless owner_teammate || admin_teammate
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
        format.html { redirect_to pitch_teammate_path(@pitch, @teammate), notice: "Um pedido de confirmação foi enviado para #{@teammate.user.name}" }
        format.json { render :show, status: :created, location: [@pitch, @teammate] }
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
        format.html { redirect_to pitch_teammate_path(@pitch, @teammate), notice: "O Tripulante #{@teammate.user.name} foi atualizado." }
        format.json { render :show, status: :ok, location: [@pitch, @teammate] }
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
      format.html { redirect_to pitch_teammate_path(@pitch, @teammate), notice: "O Tripulante #{@teammate.user.name} foi removido e será notificado." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_teammate
      @teammate = Teammate.find(params[:id])
      @current_obj = @teammate
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def teammate_params
      if owner_teammate
        base_params = params.require(:teammate).permit(:role, :permissions)
        base_params[:permissions] == '1' ? base_params[:permissions] = 'admin' : base_params[:permissions] = 'none'
      else
        base_params = params.require(:teammate).permit(:role)
      end

      base_params.merge!(user_hash_id: params[:user_id], pitch_id: params[:pitch_id])
    end
end