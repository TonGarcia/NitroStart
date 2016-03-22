class User < ActiveRecord::Base
  # Concerns Dependencies
  include Name
  include Legal
  include Profile
  include Security

  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  # :validatable
  devise :database_authenticatable, :registerable, :timeoutable, :confirmable,
         :lockable, :recoverable, :rememberable, :trackable, :validatable, :omniauthable

  # Attachments
  mount_uploader :profile, ProfileUploader

  # Relations
  has_many :pitches
  has_many :teammates
  has_many :start_ups
  has_many :social_sessions
  has_many :pitches, through: :teammates

  # Custom validations
  # after_create :sign_up
  # before_validation :setup

  # Rails validations
  validates :locale, length: { is: 5 }, presence: true, on: [:create, :update]
  validates :legal_id, length: { is: 11 }, presence: true, if: :legal_id, on: [:create, :update]
  validates :name, length: { minimum: 8, maximum: 45 }, presence: true, on: [:create, :update]

  # Validates uniqueness
  validates_uniqueness_of :legal_id, if: :legal_id

  # Logic Attr (not persisted)
  attr_accessor :password_rechecked
  attr_accessor :teammate_ref

  # Return the team which the user have accept invitation (association = :start_up or :pitch)
  def confirmed_team(association)
    self.send(association.to_s).where(teammates: {verified: true})
  end

  # return it teammate register for a pitch
  def teammate(pitch)
    return {error: 'pitch nil'} if pitch.nil?
    return self.teammate_ref unless self.teammate_ref.nil?
    self.teammate_ref = self.teammates.where(pitch_id: pitch.id).take
  end

  # Return if it user is already a supporter of the passed campaign
  def is_a_supporter_of?(campaign)
    !campaign.supporters.where(user_id: self.id).take.nil?
  end

  # ================================ STATIC METHODS ================================
  # Return it ID decrypted
  def self.decrypt_identifier(encrypted_id)
    crypt = ActiveSupport::MessageEncryptor.new(Rails.application.secrets.secret_key_base)
    crypt.decrypt_and_verify(encrypted_id)
  end

  private
    # Check if it user is new & if it have a Social Session
    def has_social_and_not_persisted
      !self.social_sessions.empty? && self.id.nil?
    end
end