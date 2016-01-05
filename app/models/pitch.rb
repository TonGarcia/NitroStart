class Pitch < ActiveRecord::Base
  # Relations
  belongs_to :user

  # The many associations mean the many possibilities
  has_many :ideas
  has_many :businesses
  has_many :projects
  has_many :markets
  has_many :traction
  has_many :revenues
  has_many :financial
  has_many :competitors
  has_many :teams
  has_many :investments

  # Rails validations
  validates :name, length: { minimum: 2, maximum: 30 }

  # Association validations
  validates_presence_of :user
end
