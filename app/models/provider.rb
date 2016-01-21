class Provider < ActiveRecord::Base
  # Concerns Dependencies
  include Formatter
  include WidgetTracker

  # Relations
  belongs_to :pitch
  belongs_to :start_up

  # Rails validations
  validates :name, length: { minimum: 2, maximum: 75 }, presence: true
  validates :segment, length: { minimum: 2, maximum: 75 }, presence: true
  validates :provides, length: { minimum: 2, maximum: 255 }, presence: true
  validates :counterpart, length: { minimum: 2, maximum: 255 }, allow_blank: true
end