module CompetitorsHelper
  def competitor_all_attrs
    competitor_their_results+competitor_feedback_results+competitor_your_propositions
  end

  def competitor_index_attrs
    [:name]+competitor_their_results+competitor_feedback_results+competitor_your_propositions
  end

  def competitor_their_results
    [:formatted_price, :formatted_total_customers, :formatted_total_revenue]
  end

  def competitor_feedback_results
    [:success_stories, :bad_stories]
  end

  def competitor_your_propositions
    [:formatted_your_advantage]
  end
end