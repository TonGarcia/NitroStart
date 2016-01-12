module CompetitorsHelper
  def competitor_index_attrs
    [:name]+competitor_their_results+competitor_feedback_results+competitor_your_propositions
  end

  def competitor_their_results
    [:price, :total_costumer, :revenue]
  end

  def competitor_feedback_results
    [:success_stories, :bad_stories]
  end

  def competitor_your_propositions
    [:your_advantage]
  end
end
