class IdeasController < ApplicationController
  # Controllers Concerns
  include HistoricalControllers
  add_breadcrumb I18n.t('actions.ideas.index'), :pitch_ideas_path
  add_breadcrumb I18n.t('actions.ideas.show'), :pitch_idea_path, only: %w(show)
  add_breadcrumb I18n.t('actions.ideas.new'), :new_pitch_idea_path, only: %w(new)

  #  Event Triggers
  before_action :set_idea, only: [:show, :edit, :update, :destroy]

  # GET /ideas
  # GET /ideas.json
  def index
    @ideas = Idea.all
  end

  # GET /ideas/1
  # GET /ideas/1.json
  def show
  end

  # GET /ideas/new
  def new
    @idea = Idea.new
  end

  # GET /ideas/1/edit
  def edit
  end

  # POST /ideas
  # POST /ideas.json
  def create
    @idea = Idea.new(idea_params)

    respond_to do |format|
      if @idea.save
        format.html { redirect_to [@pitch, @idea], notice: 'Hipótese criada com Sucesso!' }
        format.json { render :show, status: :created, location: @idea }
      else
        format.html { render :new }
        format.json { render json: @idea.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /ideas/1
  # PATCH/PUT /ideas/1.json
  def update
    respond_to do |format|
      if @idea.update(idea_params)
        format.html { redirect_to [@pitch, @idea], notice: 'Hipótese atualizada com Sucesso.' }
        format.json { render :show, status: :ok, location: @idea }
      else
        format.html { render :edit }
        format.json { render json: @idea.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /ideas/1
  # DELETE /ideas/1.json
  def destroy
    @idea.destroy
    respond_to do |format|
      format.html { redirect_to @pitch, notice: 'Hipótese deletada com Sucesso.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_idea
      @idea = Idea.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def idea_params
      params.require(:idea).permit(:main_problem, :second_problems, :current_solution, :tag_line_pitch, :high_concept_pitch, :how_validate).merge!(pitch_id: params[:pitch_id])
    end
end
