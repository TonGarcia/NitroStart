# encoding: utf-8

class AvatarUploader < ImageUploader
  # Provide a default URL as a default if there hasn't been a file uploaded:
  def default_url
    'brand/ios_app_icon.png'
  end
end