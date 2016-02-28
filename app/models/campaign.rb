class Campaign < ActiveRecord::Base
  # Concerns Dependencies
  include Viewer
  include Formatter
  include WidgetTracker

  # Relations
  belongs_to :pitch
  has_many :supporters

  # Rails validations
  validates :locale, length: { is: 2 }, presence: true
  validates :link, length: { minimum: 3, maximum: 55 }, presence: true
  validates_uniqueness_of :link, on: [:create, :update]

  # Validate Association
  validates_presence_of :pitch_id

  # Locale Countries Array
  def locale_countries
    Helpers::Globals.find_all_countries_by_languages(self.locale)
  end

  # Return teammates which have no pending
  def active_team
    self.pitch.active_team
  end

  # Return it creator user
  def owner
    self.pitch.user
  end

  # Return it pitch name
  def name
    self.pitch.name
  end

  # Return it currency hash
  def locale_currency
  end
end