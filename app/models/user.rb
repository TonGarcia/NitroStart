class User < ActiveRecord::Base
  # Concerns Dependencies
  include Name
  include Legal
  include Profile
  include Security

  # Devise Methods
  devise :database_authenticatable, :registerable, :confirmable, :timeoutable,
         :lockable, :recoverable, :rememberable, :trackable, :validatable, :omniauthable

  # Relations
  has_many :pitches
  has_many :social_sessions

  # Custom validations
  # after_create :sign_up
  # before_validation :setup
  validate :full_name_format

  # Rails validations
  validates :locale, length: { is: 5 }, presence: true, on: [:create, :update]
  validates :name, length: { minimum: 8, maximum: 45 }, presence: true, on: [:create, :update]

  # Logic Attr (not persisted)
  attr_accessor :password_rechecked

  private
    # validate full name format
    def full_name_format
      valid_full_name = true

      if !self.name.nil?
        # Must contains white space
        valid_full_name = false if (/^(.*\s+.*)+$/i =~ self.name).nil?
        # Must be alpha
        valid_full_name = false if(/^[A-Z]+$/i =~ self.name.remove(' ')).nil?
      else
        valid_full_name = false
      end

      if !valid_full_name
        self.errors.add(:name, 'must be your valid Full Name')
        raise ActiveRecord::Rollback
      end
    end
end
