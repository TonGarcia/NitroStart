class User < ActiveRecord::Base
  # Concerns Dependencies
  include Name
  include Legal
  include Profile
  include Security

  # Devise Methods
  devise :database_authenticatable, :registerable, :confirmable, :timeoutable,
         :lockable, :recoverable, :rememberable, :trackable, :validatable, :omniauthable

  # Attachments
  mount_uploader :avatar, AvatarUploader

  # Relations
  has_many :pitches
  has_many :social_sessions
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

  private
    # Check if it user is new & if it have a Social Session
    def has_social_and_not_persisted
      !self.social_sessions.empty? && self.id.nil?
    end
end