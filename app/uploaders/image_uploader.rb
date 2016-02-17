# encoding: utf-8

class ImageUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick

  # Whitelist for what kind of upload accepted
  def extension_white_list
    %w(jpg jpeg gif png) unless mounted_as == :video_thumbnail
  end

  # Dynamic Store Selection
  def self.choose_storage
    Rails.env.production? ? :aws : :file
  end

  # Dynamic Store Selection
  storage choose_storage

  # Upload Directory
  def store_dir
    "uploads/#{model.class.to_s.pluralize.underscore}/#{mounted_as}/#{model.id}"
  end

  # Directory for tmp uploads using cache
  def cache_dir
    "#{Rails.root}/tmp/uploads"
  end

  process quality: 80
end