# encoding: utf-8

class ProfileUploader < ImageUploader
  # Provide a default URL as a default if there hasn't been a file uploaded:
  def default_url
    if model.social_sessions.empty?
      'defaults/profile.jpg'
    else
      social_picture_url = model.social_sessions.where.not(picture: nil).take.picture
      social_picture_url = "#{social_picture_url}?type=large" unless social_picture_url.index('facebook').nil?
      social_picture_url
    end
  end
end