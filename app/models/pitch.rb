class Pitch < ActiveRecord::Base
  # Concerns Dependencies
  include HistoricalTrackable

  # Relations
  belongs_to :user

  # The many associations mean the many possibilities
  has_many :ideas
  has_many :teams
  has_many :markets
  has_many :revenues
  has_many :projects
  has_many :financials
  has_many :tractions
  has_many :supporters
  has_many :businesses
  has_many :investments
  has_many :competitors

  # Rails validations
  validates :name, length: { minimum: 2, maximum: 30 }

  # Association validations
  validates_presence_of :user
end