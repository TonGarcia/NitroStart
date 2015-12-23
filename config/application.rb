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
    config.exceptions_app = self.routes

    # Load Lib files
    config.autoload_paths += %W(#{config.root}/lib)

    # SetUp devise layout for it yield
    config.to_prepare do
      Devise::SessionsController.layout proc{ |controller| action_name == 'new' ? 'sign'   : 'application' }
    end

    # Load social keys
    social_keys = File.join(Rails.root, 'config', 'social_keys.yml')
    CONFIG = HashWithIndifferentAccess.new(YAML::load(IO.read(social_keys)))[Rails.env]
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

    # Amazon S3 With paper-clip
    aws_config = YAML.load_file("#{Rails.root.to_s}/config/aws.yml")
    aws_dev = aws_config['development']
    aws_prod = aws_config['production']

    # Amazon S3 With paper-clip (ENV)
    Rails.env.production? ? aws = aws_prod : aws = aws_dev
    aws = aws.symbolize_keys!

    config.paperclip_defaults = {
        storage: :s3,
        s3_credentials: {
            url: "https://s3.amazonaws.com/#{aws[:bucket]}/",
            bucket: aws[:bucket],
            region: aws[:region],
            access_key_id: aws[:access_key_id],
            secret_access_key: aws[:secret_access_key]
        }
    }
  end
end
