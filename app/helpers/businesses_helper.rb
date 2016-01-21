module BusinessesHelper
  def business_all_attrs
    business_balance_attrs+business_model_attrs+business_result_attrs
  end

  def business_index_attrs
    [:partnerships, :revenue_model, :value_proposition]
  end

  def business_balance_attrs
    [:formatted_advantages, :formatted_disadvantages]
  end

  def business_model_attrs
    [:partnerships, :revenue_model]
  end

  def business_result_attrs
    [:value_proposition, :costumer_success_stories]
  end
end