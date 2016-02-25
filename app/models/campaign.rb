class Campaign < ActiveRecord::Base
  # Concerns Dependencies
  include Viewer
  include Formatter
  include WidgetTracker

  # Relations
  belongs_to :pitch
  belongs_to :start_up
  has_many :supporters

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

  # Return it nested/parent obj
  def nested_obj
    return self.pitch if self.pitch_id
    return self.start_up if self.start_up_id
  end

  # Return it nested/parent obj (:startup / :pitch) name
  def name
    self.nested_obj.name
  end

  # Return it currency hash
  def locale_currency
  end
end