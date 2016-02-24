module TeammatesHelper
  # Aditional user teammate card class to show it user state/role (admin, normal, pending_confirmation)
  def additional_user_card_class(teammate)
    if teammate.confirmation_pending?
      pending_add_class = 'amber lighten-5 amber-text text-darken-4'
      return pending_add_class
    elsif teammate.user_id == @nested_obj.user_id
      owner_add_class = 'purple lighten-5 purple-text text-darken-2'
      return owner_add_class
    elsif teammate.admin?
      admin_add_class = 'light-blue lighten-5 light-blue-text text-darken-2'
      return admin_add_class
    end
  end

  # User owner condition
  def owner_teammate
    @current_user.id == @nested_obj.user_id
  end

  # Check if it user is an admin
  def admin_teammate(teammate=nil)
    teammate ? teammate.admin? : @current_user.teammate(@nested_obj).admin?
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
    owner_teammate || current_teammate(teammate)
  end
end