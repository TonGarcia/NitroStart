class Campaign < ActiveRecord::Base
  # Concerns Dependencies
  include Viewer
  include Formatter
  include WidgetTracker
  include Rails.application.routes.url_helpers

  # Relations
  belongs_to :pitch
  has_many :supporters
  has_many :page_views
  has_many :customer_fundings

  # Setup attributes, like CheckoutPage
  after_create :create_checkout_link
  before_validation :update_checkout_link, on: :update

  # Rails validations
  validates :locale, length: { is: 2 }, presence: true
  validates :permalink, length: { minimum: 3, maximum: 55 }, presence: true
  validates_uniqueness_of :permalink, on: [:create, :update]

  # Validate Association
  validates_presence_of :body
  validates_presence_of :pitch_id

  # Locale Countries Array
  def locale_countries
    Helpers::Globals.find_all_countries_by_languages(self.locale)
  end

  # Return unique page views based on cookie_id
  def unique_page_views
    self.page_views.where(cookie_id: nil).length
  end

  # Return teammates which have no pending
  def active_team
    self.pitch.active_team
  end

  def teammate?(user)
    return false if user.nil?
    !self.active_team.where(user_id: user.id).take.nil?
  end

  # Return it creator user
  def owner
    self.pitch.user
  end

  # Return it pitch name
  def name
    self.pitch.name
  end

  private
    def create_checkout_link
      title = self.name
      redirect = pitch_campaign_checkout_callback_url(self.pitch, self, host: Helpers::StaticConfigs.host)
      alert_msg = "Atenção! Você está comprando créditos válidos somente para aquisição de itens do projeto #{title}."
      description = "<strong>Projeto</strong>: #{title}<br><strong>Tipo da Compra</strong>: Créditos para uso exclusivo neste projeto, após o lançamento do mesmo<br><strong>Descrição</strong>: #{self.pitch.active(:idea).tag_line_pitch}."

      checkout_page_params = {
          title: title,
          alert: alert_msg,
          redirect_link: redirect,
          description: description
      }
    end

    def update_checkout_link
      title = self.name
      redirect = Rails.application.routes.url_helpers.pitch_campaign_callback_url(self.pitch, self, host: Helpers::StaticConfigs.host)
      alert_msg = "Atenção! Você está comprando créditos válidos somente para aquisição de itens do projeto #{title}."
      description = "<strong>Projeto</strong>: #{title}<br><strong>Tipo da Compra</strong>: Créditos para uso exclusivo neste projeto, após o lançamento do mesmo<br><strong>Descrição</strong>: #{self.pitch.active(:idea).tag_line_pitch}."

      checkout_page_params = {
          title: title,
          alert: alert_msg,
          redirect_link: redirect,
          description: description
      }
    end
end