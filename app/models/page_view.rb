class PageView < ActiveRecord::Base
  # Relations
  belongs_to :campaign
  belongs_to :supporter

  # Rails validations (Must be Present)
  validates :ip, length: { maximum: 30 }, presence: true
  validates :url, length: { maximum: 140 }, presence: true

  # Association Validations
  validates_presence_of :campaign_id
end