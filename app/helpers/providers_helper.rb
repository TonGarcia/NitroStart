module ProvidersHelper
  def provider_index_attrs
    [:name, :provides]
  end

  def provider_info_attrs
    [:name, :segment]
  end

  def provider_relation_attrs
    [:provides, :counterpart]
  end
end