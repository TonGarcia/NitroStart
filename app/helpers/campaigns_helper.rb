module CampaignsHelper
  def campaign_index_attrs
    [:formatted_locale, :link] #locale_flags
  end

  def h_full_report_path(nested, current)
    nested_class = nested.class.to_s.downcase
    send("#{nested_class}_campaign_full_report_path", nested, current)
  end
end