module CampaignsHelper
  def format_int(value)
    number_with_delimiter(value, delimiter: '.')
  end

  def format_currency(value)
    number_to_currency(value, unit: 'R$', separator: ',', delimiter: '.')
  end

  def campaign_index_attrs
    [:formatted_locale, :permalink] #locale_flags
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
    cookie_id = page_view_for_it_campaign?
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
    insert_on_cookie(page_view) if cookie_id.nil?
  end

  def insert_on_cookie(page_view)
    cookies[:visits] = "#{@campaign.id}-#{page_view.id},#{cookies[:visits]}"
  end

  def page_view_for_it_campaign?
    cookies[:visits] = '' if cookies[:visits].nil?
    visits = cookies[:visits].split(',')
    visits.each do |visit|
      visit_attr = visit.split('-')
      campaign = visit_attr.first.to_i
      page_view = visit_attr.last.to_i

      if campaign == @campaign.id
        return page_view
      end
    end

    nil
  end
end