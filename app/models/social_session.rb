class SocialSession < ActiveRecord::Base
  # Relations
  belongs_to :user
  has_many :additional_infos

  # Custom validations
  validate :expires_at_date, on: [:create, :update], if: :expires_at

  # Rails validations
  validates :uid, length: { minimum: 1, maximum: 65}, presence: true, on: [:create, :update]
  validates :name, length: { minimum: 3, maximum: 60}, presence: true, on: [:create, :update]
  validates :provider, length: { minimum: 2, maximum: 50}, presence: true, on: [:create, :update]
  validates :secret, length: { minimum: 1, maximum: 255}, presence: true, on: [:create, :update], if: :secret
  validates :username, length: { minimum: 3, maximum: 60}, presence: true, on: [:create, :update], if: :username
  validates :picture, length: { minimum: 10, maximum: 60}, presence: true, on: [:create, :update], if: :picture
  validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i }, presence: true, on: [:create, :update], if: :email

  # Validates Associations
  validates :user_id, presence: true, on: [:create, :update]

  # Validations & Callbacks
  private
    def expires_at_date
      expires_at = Date.new(expires_at) if expires_at.is_a?String
      raise ActiveRecord::Rollback if expires_at.nil?
    end
end