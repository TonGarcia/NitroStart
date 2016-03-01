# app/controllers/concerns/historical_controllers.rb
module HistoricalControllers
  extend ActiveSupport::Concern

  # View Helpers to Controller
  include TeammatesHelper

  included do
    before_action :set_pitch
    before_action :previous_controller
    before_action :check_if_has_list, only: :index
    before_action :check_user_admin_permissions, except: [:index, :show]
    before_action :check_user_teammate_permissions, only: [:index, :show]
  end

  # Setup it dependence (objects)
  def set_pitch
    # Setup variables
    @pitch = @current_user.pitches.where(id: params[:pitch_id]).take if params[:pitch_id]

    # Raise 403 if pitch not found
     redirect_to(forbidden_path) if @pitch.nil?
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

  # Check if it current_user has admin permissions to exec it action
  def check_user_admin_permissionsc
    current_user_teammate = @current_user.teammates.where(pitch_id: @pitch.id).take
    redirect_to forbidden_path unless admin_teammate(current_user_teammate)
  end

  # Check if it current_user is a teammate to have permissions to exec it action
  def check_user_teammate_permissions
    current_user_teammate = @current_user.teammates.where(pitch_id: @pitch.id).take
    redirect_to forbidden_path if current_user_teammate.nil?
  end
end