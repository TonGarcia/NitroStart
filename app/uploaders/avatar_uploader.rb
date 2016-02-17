# encoding: utf-8

class AvatarUploader < ImageUploader
  # Convert & process uploaded file
  version :base
  version :base do
    # process resize_to_fill: [1350,300]
    process convert: :jpg
  end

  # Provide a default URL as a default if there hasn't been a file uploaded:
  def default_url
    'brand/ios_app_icon.png'
  end
end
