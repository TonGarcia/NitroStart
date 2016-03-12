module CampaignsHelper
  def format_int(value)
    number_with_delimiter(value, delimiter: '.')
  end

  def format_currency(value)
    number_to_currency(value, unit: 'R$', separator: ',', delimiter: '.')
  end

  def campaign_index_attrs
    [:formatted_locale, :link] #locale_flags
  end

  def h_full_report_path(pitch, campaign)
    pitch_campaign_full_report_path(pitch, campaign)
  end

  def setup_page_view
    return unless params[:controller] == 'showroom'

    # Setup Variables
    url = request.url
    ip = request.remote_ip
    device = browser.platform
    cookie_id = cookies[:page_view_id]
    locale = Geokit::Geocoders::MultiGeocoder.geocode(ip).to_hash[:country_code]
    locale = 'br' if locale.nil? && ip == '127.0.0.1'

    # Setup relations
    @current_user ? user_id = @current_user.id : user_id = nil
    @campaign ? campaign_id = @campaign.id : campaign_id = nil
    @supporter ? supporter_id = @supporter.id : supporter_id = nil

    page_view_params = {
      ip: ip,
      url: url,
      locale: locale,
      device: device,
      user_id: user_id,
      cookie_id: cookie_id,
      campaign_id: campaign_id,
      supporter_id: supporter_id
    }

    page_view = PageView.create page_view_params
    cookies[:page_view_id] = page_view.id if cookies[:page_view_id].nil? || cookies[:page_view_id].empty?
  end
end