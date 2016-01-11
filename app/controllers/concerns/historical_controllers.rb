# app/controllers/concerns/historical_controllers.rb
module HistoricalControllers
  extend ActiveSupport::Concern

  included do
    before_action :set_nested
    before_action :previous_controller
    before_action :check_if_has_list, only: :index
  end

  # Setup it dependence (objects)
  def set_nested
    @pitch = Pitch.find(params[:pitch_id]) if params[:pitch_id]
    @start_up = StartUp.find(params[:start_up_id]) if params[:start_up_id]
    @nested_obj = @pitch || @start_up
  end

  # If there is no list it redirects to new
  def check_if_has_list
    single_obj_class_name = params[:controller].singularize
    obj_class = single_obj_class_name.humanize.constantize

    # Check dependency
    if params[:pitch_id]
      objs = obj_class.where(pitch_id:params[:pitch_id])
      redir_path = send("new_pitch_#{single_obj_class_name}_path", params[:pitch_id])
    elsif params[:start_up_id]
      objs = obj_class.where(start_up_id:params[:start_up_id])
      redir_path = send("new_pitch_#{single_obj_class_name}_path", params[:start_up_id])
    end

    # Check if necessary to redirect
    redirect_to redir_path if objs.empty?
  end

  # Return it previous controller
  def previous_controller
    if params[:pitch_id]
      add_breadcrumb I18n.t('actions.pitch.index'), pitches_path
    elsif params[:start_up_id]
      add_breadcrumb I18n.t('actions.start_up.index'), pitches_path
    end
  end
end