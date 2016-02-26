class SupportersController < ApplicationController
  #  Event Triggers
  before_action :set_supporter, only: [:show, :edit, :update, :destroy]

  # GET /supporters
  # GET /supporters.json
  def index
    @supporters = Supporter.all
  end

  # GET /supporters/1
  # GET /supporters/1.json
  def show
  end

  # GET /supporters/new
  def new
    @supporter = Supporter.new
  end

  # GET /supporters/1/edit
  def edit
  end

  # POST /supporters
  # POST /supporters.json
  def create
    @supporter = supporter.new(supporter_params)

    respond_to do |format|
      if @supporter.save
        format.html { redirect_to [@nested_obj, @supporter], notice: 'Modelo de Negócio salvo com sucesso.' }
        format.json { render :show, status: :created, location: @supporter }
      else
        format.html { render :new }
        format.json { render json: @supporter.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /supporters/1
  # PATCH/PUT /supporters/1.json
  def update
    respond_to do |format|
      if @supporter.update(supporter_params)
        format.html { redirect_to [@nested_obj, @supporter], notice: 'Modelo de Negócio Atualizado com Sucesso!' }
        format.json { render :show, status: :ok, location: @supporter }
      else
        format.html { render :edit }
        format.json { render json: @supporter.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /supporters/1
  # DELETE /supporters/1.json
  def destroy
    @supporter.destroy
    respond_to do |format|
      format.html { redirect_to @nested_obj, notice: 'supporter was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_supporter
      @supporter = supporter.find(params[:id])
      @current_obj = @supporter
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def supporter_params
      params.require(:supporter).permit(:how_much_pays, :pay_the_expected, :positive_feedback, :negative_feedback).merge!(pitch_id: params[:pitch_id], start_up_id: params[:start_up_id])
    end
end