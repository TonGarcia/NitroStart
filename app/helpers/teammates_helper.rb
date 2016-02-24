module TeammatesHelper
  def additional_user_card_class(teammate)
    if teammate.confirmation_pending?
      return 'amber lighten-5 amber-text text-darken-4'
    elsif teammate.admin?
      return 'purple lighten-5 purple-text text-darken-2'
    end
  end
end