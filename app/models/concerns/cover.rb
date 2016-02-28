# Capability avatar methods
module Cover
  extend ActiveSupport::Concern

  # Upload validations for which include it
  included do
    has_attached_file :cover,
                      storage: :s3,
                      s3_credentials: "#{Rails.root}/config/aws.yml",
                      path: "#{self.to_s.downcase.pluralize}/:attachment/:id/:style/#{self.to_s.downcase}_work_flow",
                      url: ':s3_domain_url',
                      styles: { original: '1350x300>' },
                      default_url: 'defaults/startupers_cover.jpg', if: :cover?
    validates_attachment_content_type :cover, content_type: /\Aimage\/.*\Z/, if: :cover?
    validates_attachment_size :cover, less_than: 350.kilobyte, if: :cover?
  end

  # Custom get avatar
  def picture(type=:thumb)
    # Check it avatar or it avatar ref
    return self.cover.url(type) if self.cover_file_name
    nil
  end

  def cover?
    self.cover_file_name
  end
end