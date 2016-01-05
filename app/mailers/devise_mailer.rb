# -*- encoding : utf-8 -*-
class DeviseMailer < Devise::Mailer
  helper :home # gives access to all helpers defined within `application_helper`.
  include Devise::Controllers::UrlHelpers # Optional. eg. `confirmation_url`

  layout 'mailer'

  # before_filter :add_inline_attachments!

  # Add Upload Attached
  # def add_inline_attachments!
  #   attachments.inline['nitro_purple_logo.png'] = File.read("#{Rails.root}/public/nitro_purple_logo.png")
  # end
end