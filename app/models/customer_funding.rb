class CustomerFunding < ActiveRecord::Base
  # Relations
  belongs_to :user
  belongs_to :pitch
  belongs_to :supporter
  belongs_to :campaign

  # Rails validations
  validates :tid, length: {minimum: 1}, presence: true
  validates :response, length: {minimum: 5}, presence: true
  validates :amount, numericality: {greater_than: 0}, presence: true
  validates :status, numericality: {greater_than_or_equal_to: 0}, presence: true

  # Rails Associations Validations
  validates_presence_of :user
  validates_presence_of :pitch
  validates_presence_of :campaign
  validates_presence_of :supporter
end