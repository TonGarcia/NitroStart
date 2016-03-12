class Visitor < ActiveRecord::Base
  # Relations
  belongs_to :campaign

  # Rails Validations
  validates :country, length: { is: 2 }, presence: true
  validates :ip, length: { minimum: 7, maximum: 35 }, presence: true
  validates :country, length: { minimum: 2, maximum: 140 }, presence: true

  # Association Validations
  validates_presence_of :campaignp_id
end