CarrierWave.configure do |config|
  config.aws_acl    = 'public-read'
  config.aws_bucket = ENV['S3_BUCKET_NAME']

  # Set custom options such as cache control to leverage browser caching
  config.aws_attributes = {
    expires: 1.week.from_now.httpdate,
    cache_control: 'max-age=604800'
  }

  # Setup AWS Credentials
  config.aws_credentials = {
    region:            ENV['AWS_REGION'],
    access_key_id:     ENV['AWS_ACCESS_KEY_ID'],
    secret_access_key: ENV['AWS_SECRET_ACCESS_KEY']
  }

  # UNCOMMENT IF AN IMAGE CAN'T BE RETRIEVED IF USER NOT LOGGED
  # config.aws_signer = -> (unsigned_url, options) { Aws::CF::Signer.sign_url unsigned_url, options }
end

module CarrierWave
  module MiniMagick
    def quality(percentage)
      manipulate! do |img|
        img.quality(percentage.to_s)
        img = yield(img) if block_given?
        img
      end
    end
  end
end
