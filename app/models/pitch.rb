class Pitch < ActiveRecord::Base
  # Concerns Dependencies
  include EquityMath
  include TeammatesAssociations
  include HistoricalTrackable

  # Attachments
  mount_uploader :cover, CoverUploader
  mount_uploader :avatar, AvatarUploader

  # Relations
  belongs_to :user

  # The many associations mean the many possibilities
  has_many :ideas, dependent: :destroy
  has_many :markets, dependent: :destroy
  has_many :projects, dependent: :destroy
  has_many :providers, dependent: :destroy
  has_many :tractions, dependent: :destroy
  has_many :financials, dependent: :destroy
  has_many :supporters, dependent: :destroy
  has_many :businesses, dependent: :destroy
  has_many :competitors, dependent: :destroy
  has_many :campaigns, dependent: :destroy
  has_many :teammates, dependent: :destroy

  # The One Association
  has_one :start_up

  # Rails validations
  validates :name, length: { minimum: 2, maximum: 55 }

  # Association validations
  validates_presence_of :user
end