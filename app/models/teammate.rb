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

  # Mailer Notification
  after_save :send_invitation_email
  before_destroy :send_disassociation_email

  # Custom Attrs
  attr_accessor :user_hash_id

  # Check if it teammate is an admin
  def admin?
    self.permissions.to_sym == :admin || self.owner?
  end

  # Check if it user is the pitch creator
  def owner?
    return false if self.nested_obj.nil?
    self.nested_obj.user_id == self.user_id
  end

  # Check if it teammate had confirmed
  def confirmation_pending?
    return false if owner?
    !self.verified
  end

  # Return it filled nested (pitch/startup)
  def nested_obj
    self.pitch || self.start_up
  end

  private
    # setup variables & attributes
    def setup
      if !self.id && !self.user_id
        self.user_id = User.decrypt_identifier(self.user_hash_id)
      end
    end

    # Delivery an invitation email to notify the team association
    def send_invitation_email
      unless self.verified?
        TeamMailer.invitation_email(self, nested_obj).deliver_later
      end
    end

    # Delivery a Disassociation Notification E-mail
    def send_disassociation_email
      TeamMailer.disassociation_email(self, nested_obj).deliver_later
    end
end