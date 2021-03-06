module ProvidersHelper
  def provider_all_attrs
    provider_info_attrs+provider_relation_attrs
  end

  def provider_index_attrs
    [:name, :formatted_provides]
  end

  def provider_info_attrs
    [:name, :segment]
  end

  def provider_relation_attrs
    [:formatted_provides, :formatted_counterpart]
  end
end