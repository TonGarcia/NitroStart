class Pitch < ActiveRecord::Base
  # Relations
  belongs_to :user

  # Rails validations
  validates :name, length: { minimum: 2, maximum: 30 }

  # Association validations
  validates_presence_of :user
end
