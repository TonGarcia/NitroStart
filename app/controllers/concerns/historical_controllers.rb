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
    # Setup variables
    @pitch = @current_user.pitches.where(id: params[:pitch_id]).take if params[:pitch_id]
    @start_up = @current_user.start_ups.where(id: params[:start_up_id]).take if params[:start_up_id]

    # Raise 403
    redirect_to(forbidden_path) if @pitch.nil? && @start_up.nil?

    # Return it
    @nested_obj = @start_up || @pitch
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