class Supporter < ActiveRecord::Base
  # Concerns Dependencies
  include WidgetTracker

  # Relations
  belongs_to :user
  belongs_to :pitch
  belongs_to :campaign

  # Rails Validations
  validates :feedback_type, length: { minimum: 1, maximum: 20 }, presence: true
  validates :how_much_pays, numericality: { greater_than_or_equal_to: 0 }, presence: true
  validates :positive_feedback, length: { minimum: 3, maximum: 140 }, if: :positive?
  validates :negative_feedback, length: { minimum: 3, maximum: 140 }, if: :negative?


  # Validate Associations
  validates_presence_of :user_id
  validates_presence_of :pitch_id
  validates_presence_of :campaign_id

  private
    def positive?
      self.feedback_type == 'positive'
    end

    def negative?
      self.feedback_type == 'negative'
    end
end