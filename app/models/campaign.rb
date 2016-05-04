class Campaign < ActiveRecord::Base
  # Concerns Dependencies
  include Viewer
  include Formatter
  include WidgetTracker
  include Rails.application.routes.url_helpers

  # Attachments
  mount_uploader :banner, CoverUploader

  # Relations
  belongs_to :idea
  belongs_to :pitch
  has_many :customer_fundings
  has_many :supporters, dependent: :destroy
  has_many :page_views, dependent: :destroy

  # Setup attributes, like CheckoutPage
  before_validation :create_checkout_link
  before_validation :check_video_link
  before_update :update_checkout_link

  # Rails validations
  validates :locale, length: { is: 2 }, presence: true
  validates :permalink, length: { minimum: 3, maximum: 55 }, presence: true
  validates_uniqueness_of :permalink, on: [:create, :update]

  # Validate Association
  validates_presence_of :pitch_id
  validates_presence_of :idea_id

  # Aux attributes
  attr_accessor :raised
  attr_accessor :current_teammate
  attr_accessor :just_created

  # Locale Countries Array
  def locale_countries
    Helpers::Globals.find_all_countries_by_languages(self.locale)
  end

  # Return unique page views based on cookie_id
  def unique_page_views
    self.page_views.where(cookie_id: nil).length
  end

  # Return people which have returned
  def recurrent_page_views
    self.page_views.where.not(cookie_id: nil).group(:cookie_id).length
  end

  # Return teammates which have no pending
  def active_team
    self.pitch.active_team
  end

  def teammate?(user)
    return false if user.nil?
    current_teammate.nil? ? current_teammate = !self.active_team.where(user_id: user.id).take.nil? : current_teammate
  end

  # Return it creator user
  def owner
    self.pitch.user
  end

  # Return it pitch name
  def name
    self.pitch.name
  end

  # Amount of people that bought
  def amount_customers
    self.customer_fundings.group(:user_id).length
  end

  # Amount of "how much do you pay"
  def amount_how_much_wold_pay
    self.supporters.sum(:how_much_pays)
  end

  # Average of "how much do you pay"
  def average_how_much_wold_pay
    amount_pay = amount_how_much_wold_pay
    amount_supporters = self.supporters.length
    amount_supporters > 0 && amount_pay > 0 ? amount_how_much_wold_pay/self.supporters.length : 0
  end

  # Return it amount raised by supporter funding
  def supporter_funding_raised
    card_operator_formatter = 100
    formatted_amount = customer_fundings.sum(:amount)
    self.raised = formatted_amount/card_operator_formatter
  end

  # Return it average funding raised based on it supporters length amount
  def average_supporter_funding_raised
    self.raised = supporter_funding_raised if self.raised.nil?
    count_supporters = self.supporters.length
    return count_supporters if count_supporters == 0
    self.raised/self.supporters.length
  end

  private
    def check_video_link
      if !self.video.nil? && !self.video.empty?
        if self.video.index 'youtube'
          unless self.video.index 'embed'
            video_link_param = 'v='

            start_video_param_id = self.video.index(video_link_param)+video_link_param.length
            end_video_param_id = self.video.length

            video_remote_id = self.video[start_video_param_id..end_video_param_id]
            self.video = "https://www.youtube.com/embed/#{video_remote_id}"
          end
        else
          self.errors.add(:video, 'deve ser um Link válido do YouTube')
        end
      end
    end

    def create_checkout_link
      # Prevent infinite loop
      return if self.checkout_page_link

      title = self.name
      redirect = callback_checkout_url host: Helpers::StaticConfigs.host
      alert_msg = "Atenção! Você está comprando créditos válidos somente para aquisição de itens do projeto #{title}."
      description = "A Nitro Start garante que este Projeto será executado. Caso não seja viável, tecnicamente, você poderá remanejar seu crédito.<br><br> <strong>Projeto</strong>: #{title}<br><strong>Tipo da Compra</strong>: Créditos para uso exclusivo neste projeto, após o lançamento do mesmo<br><strong>Descrição</strong>: #{self.pitch.active(:idea).tag_line_pitch}."

      checkout_page_params = {
          title: title,
          alert: alert_msg,
          redirect_link: redirect,
          description: description
      }

      checkout_transaction = NitroPay::Transaction.new(checkout_page_params)
      resp = checkout_transaction.charge_page

      self.checkout_id = resp[:id]
      self.checkout_request_id = resp[:request_id]
      self.checkout_page_link = resp[:checkout_page]
      self.just_created = true
      self.save
    end

    def update_checkout_link
      return self.create_checkout_link unless self.checkout_page_link

      # return if self.just_created
      # title = self.name
      # redirect = pitch_campaign_checkout_callback_url(self.pitch, self, host: Helpers::StaticConfigs.host)
      # alert_msg = "Atenção! Você está comprando créditos válidos somente para aquisição de itens do projeto #{title}."
      # description = "A Nitro Start garante que este Projeto será executado. Caso não seja viável, tecnicamente, você poderá remanejar seu crédito.<br><br> <strong>Projeto</strong>: #{title}<br><strong>Tipo da Compra</strong>: Créditos para uso exclusivo neste projeto, após o lançamento do mesmo<br><strong>Descrição</strong>: #{self.pitch.active(:idea).tag_line_pitch}."
      #
      # checkout_page_params = {
      #     title: title,
      #     alert: alert_msg,
      #     redirect_link: redirect,
      #     description: description
      # }
    end
end