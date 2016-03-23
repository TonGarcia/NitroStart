# encoding: utf-8
require 'nitro_pay'

# Setup NitroPay keys
if Rails.env.production?
  NitroPay.app_id = Rails.application.secrets.nitro_pay['app_id']
  NitroPay.secret_key = Rails.application.secrets.nitro_pay['secret_key']
else
  NitroPay.debug = true
  NitroPay.test_env = true
end