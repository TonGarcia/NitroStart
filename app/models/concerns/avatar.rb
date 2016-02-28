# Capability avatar methods
module Avatar
  extend ActiveSupport::Concern

  # Upload validations for which include it
  included do
    has_attached_file :avatar,
                      storage: :s3,
                      s3_credentials: "#{Rails.root}/config/aws.yml",
                      path: "#{self.to_s.downcase.pluralize}/:attachment/:id/:style/#{self.to_s.downcase}",
                      url: ':s3_domain_url',
                      styles: { original: '300x300>', thumb: '75x75>' },
                      default_url: 'brand/ios_app_icon.png', if: :avatar?
    validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/, if: :avatar?
    validates_attachment_size :avatar, less_than: 200.kilobyte, if: :avatar?
  end

  # Custom get avatar
  def picture(type=:thumb)
    # Check it avatar or it avatar ref
    return self.avatar.url(type) if self.avatar_file_name
    nil
  end

  def avatar?
    self.avatar_file_name
  end
end