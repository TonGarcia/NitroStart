class Pitch < ActiveRecord::Base
  # Concerns Dependencies
  include EquityMath
  include HistoricalTrackable

  # Attachments
  mount_uploader :cover, CoverUploader
  mount_uploader :avatar, AvatarUploader

  # Relations
  belongs_to :user

  # The many associations mean the many possibilities
  has_many :ideas
  has_many :markets
  has_many :projects
  has_many :providers
  has_many :tractions
  has_many :financials
  has_many :supporters
  has_many :businesses
  has_many :competitors
  has_many :campaigns
  has_many :teammates

  # The One Association
  has_one :start_up

  # Rails validations
  validates :name, length: { minimum: 2, maximum: 55 }

  # Association validations
  validates_presence_of :user
end