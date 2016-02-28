module CampaignsHelper
  def campaign_index_attrs
    [:formatted_locale, :link] #locale_flags
  end

  def h_full_report_path(pitch, campaign)
    pitch_campaign_full_report_path(pitch, campaign)
  end
end