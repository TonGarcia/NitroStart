class Campaign < ActiveRecord::Base
  # Concerns Dependencies
  include Formatter
  include WidgetTracker

  # Rails validations
  validates :locale, length: { is: 2 }, presence: true
  validates :link, length: { minimum: 3, maximum: 55 }, presence: true

  # Validate Association
  validates_presence_of :pitch_id, unless: :start_up_id
  validates_presence_of :start_up_id, unless: :pitch_id

  # Convert it locale into Flag img string
  def locale_flag
  end

  # Return it currency hash
  def locale_currency
  end
end
