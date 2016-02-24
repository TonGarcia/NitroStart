class ApplicationMailer < ActionMailer::Base
  layout 'mailer'
  default from: "no-reply@nitrostart.me"

  include Rails.application.routes.url_helpers
  include Rails.application.routes.mounted_helpers
end