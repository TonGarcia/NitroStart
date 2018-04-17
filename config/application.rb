require File.expand_path('../boot', __FILE__)

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module NitroStart
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    # Set Time.zone default to the specified zone and make Active Record auto-convert to this zone.
    # Run "rake -D time" for a list of tasks for finding time zone names. Default is UTC.
    config.time_zone = 'Brasilia'

    # Set config HTTP errors on Routes
    config.exceptions_app = self.routes

    # Load Lib files
    config.autoload_paths += %W(#{config.root}/lib)

    # SetUp devise layout for it yield
    config.to_prepare do
      Devise::SessionsController.layout proc{ |controller| action_name == 'new' ? 'sign'   : 'application' }
    end

    # Setup Host
    if Rails.env.production?
      config.action_mailer.default_url_options = { host: 'www.nitrostart.me' }
    else
      config.action_mailer.default_url_options = { host: 'nitro.dev:5000' }
    end

    # Disable OAuth Logger
    Hashie.logger = Logger.new(nil)

    # Amazon S3 With paper-clip
    aws_config = YAML::load_file(Rails.root.join('config', 'aws.yml'))
    aws_dev = aws_config['development']
    aws_prod = aws_config['production']

    # Amazon S3 With paper-clip (ENV)
    Rails.env.production? ? aws = aws_prod : aws = aws_dev
    aws = aws.deep_symbolize_keys

    ENV['AWS_REGION'] = aws[:region]
    ENV['S3_BUCKET_NAME'] = aws[:bucket]
    ENV['AWS_ACCESS_KEY_ID'] = aws[:access_key_id]
    ENV['AWS_SECRET_ACCESS_KEY'] = aws[:secret_access_key]

    # Load social keys
    social_keys = YAML::load_file(Rails.root.join('config', 'social_keys.yml'))
    CONFIG = social_keys[Rails.env]
    CONFIG.each do |k,v|
      ENV[k.upcase] ||= v
    end

    # The default locale is :en and all translations from config/locales/*.rb,yml are auto loaded.
    # config.i18n.load_path += Dir[Rails.root.join('my', 'locales', '*.{rb,yml}').to_s]
    # config.i18n.default_locale = :de
    config.i18n.load_path += Dir[Rails.root.join('config', 'locales', '**', '*.{rb,yml}').to_s]
    config.i18n.default_locale = :'pt-BR'

    # Do not swallow errors in after_commit/after_rollback callbacks.
    config.assets.initialize_on_precompile = false
    config.active_record.raise_in_transactional_callbacks = true

    # Config PaperClip
    config.paperclip_defaults = {
        storage: :s3,
        s3_credentials: {
            storage: :s3,
            s3_region: ENV['AWS_REGION'],
            s3_credentials: {
                bucket: ENV['S3_BUCKET_NAME'],
                access_key_id: ENV['AWS_ACCESS_KEY_ID'],
                secret_access_key: ENV['AWS_SECRET_ACCESS_KEY']
            }
        }
    }
  end
end