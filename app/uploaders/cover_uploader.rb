# encoding: utf-8

class CoverUploader < ImageUploader
  # Provide a default URL as a default if there hasn't been a file uploaded:
  def default_url
    'defaults/startupers_cover.jpg'
  end
end