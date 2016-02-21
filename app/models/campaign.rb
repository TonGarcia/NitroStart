class Campaign < ActiveRecord::Base
  # Concerns Dependencies
  include Viewer
  include Formatter
  include WidgetTracker

  # Rails validations
  validates :locale, length: { is: 2 }, presence: true
  validates :link, length: { minimum: 3, maximum: 55 }, presence: true
  validates_uniqueness_of :link, on: [:create, :update]

  # Validate Association
  validates_presence_of :pitch_id, unless: :start_up_id
  validates_presence_of :start_up_id, unless: :pitch_id

  # Locale Countries Array
  def locale_countries
    Helpers::Globals.find_all_countries_by_languages(self.locale)
  end

  # Return it currency hash
  def locale_currency
  end
end