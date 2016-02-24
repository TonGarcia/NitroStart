class Teammate < ActiveRecord::Base
  # Concerns Dependencies
  include Formatter
  include ViewerAttr

  # Relations
  belongs_to :user
  belongs_to :pitch
  belongs_to :start_up

  # Rails validations
  validates :role, length: { minimum: 2, maximum: 45 }, presence: true

  # Association Validations
  validates_presence_of :user_id
  validates_presence_of :pitch_id, unless: :start_up_id
  validates_presence_of :start_up_id, unless: :pitch_id

  # Custom Setup attributes
  before_validation :setup

  # Custom Attrs
  attr_accessor :user_hash_id

  private
    # setup variables & attributes
    def setup
      if !self.id && !self.user_id
        self.user_id = User.decrypt_identifier(self.user_hash_id)
      end
    end
end