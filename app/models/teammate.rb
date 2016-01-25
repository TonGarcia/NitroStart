class Teammate < ActiveRecord::Base
  # Concerns Dependencies
  include ViewerAttr

  # Relations
  belongs_to :user

  # Rails validations
  validates :role, length: { minimum: 2, maximum: 45 }, presence: true
  validates :expertise, length: { minimum: 2, maximum: 140 }, presence: true

  # Association Validations
  validates_presence_of :user_id
end