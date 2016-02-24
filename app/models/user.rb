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
  has_many :social_sessions
  has_many :pitches, through: :teammates
  has_many :start_ups, through: :pitches

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

  # return it teammate register for a nestedobj (:pitch / :start_up)
  def teammate(nested_obj)
    return self.teammate_ref unless self.teammate_ref.nil?
    associated_id = "#{nested_obj.class.to_s.to_sym}_id"
    self.teammate_ref = self.teammates.where("#{associated_id}": nested_obj.id).take
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