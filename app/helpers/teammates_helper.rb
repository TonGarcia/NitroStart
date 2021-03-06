module TeammatesHelper
  # Aditional user teammate card class to show it user state/role (admin, normal, pending_confirmation)
  def user_status(teammate)
    if teammate.confirmation_pending?
      pending_add_class = 'amber'
      return {class: pending_add_class, status: 'pending', role: 'Pending'}
    elsif teammate.user_id == @pitch.user_id
      owner_add_class = 'purple'
      return {class: owner_add_class, status: 'owner', role: 'Owner'}
    elsif teammate.admin?
      admin_add_class = 'red'
      return {class: admin_add_class, status: 'admin', role: 'Admin'}
    end
  end

  def current_user_teammate
    return Teammate.new if @pitch.nil?
    @current_user.teammates.where(pitch_id: @pitch.id).take
  end

  # User owner condition
  def owner_teammate(nested_obj=nil)
    if @nested_obj
      @current_user.id == @nested_obj.user_id
    elsif nested_obj
      @current_user.id == nested_obj.user_id
    end
  end

  # Check if it user is an admin
  def admin_teammate(teammate=nil)
    teammate ? teammate.admin? : false
  end

  # Actions to skip some component
  def skip_for_it_action
    current_action = params[:action]
    current_action == 'new' || current_action == 'edit' || current_action == 'create'
  end

  # Cehck if it current teammate loop is the current user
  def current_teammate(teammate)
    @current_user.id == teammate.user_id
  end

  # Check permission to show it edit path button
  def edit_teammate_permission(teammate)
    owner_teammate || current_teammate(teammate) || (teammate.admin? && !teammate.owner?)
  end

  # Check permission to show it destroy path button
  def destroy_teammate_permission(teammate)
    (owner_teammate || current_teammate(teammate)) && @current_user.id != teammate.user_id
  end
end