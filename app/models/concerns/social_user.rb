# Easy encapsulated persistence
module Concerns
  class SocialUser
    extend ActiveSupport::Concern
    # Helper to persist the User
    def self.persist(user, auth, extra_info)
      auth_info = auth.info
      user = User.new if user.nil?
      not_validate = (auth.provider == 'twitter' || auth.provider == 'instagram')

      # User attrs
      user.password = Devise.friendly_token[0,10]
      user_name = auth_info.name || extra_info.name
      user.name = user_name unless user_name.nil? && !user.name.nil

      user_email = auth_info.email || extra_info.email
      user.email = user_email if user_email && (user.email.nil? || user.email.empty?)

      # Twitter doesn't retrieve the user gender, so it is a work arround to set it when it exists
      gender = extra_info.gender
      gender = gender.first unless gender.nil?
      user.gender = gender unless gender.nil?

      # Twitter retrieve just pt, en, it, not it-IT like facebook does
      user_locale = extra_info.locale || extra_info.lang
      if user.locale.nil? && user_locale && user_locale.length == 2
        if user_locale == 'pt'
          user_locale = "#{user_locale}_BR"
        else
          user_locale = "#{user_locale}-#{user_locale.upcase}"
        end
      end
      user.locale = user_locale if user.locale.nil? && !user_locale.nil?

      # The twitter provide the timezone name, like Brasilia, Los Angeles, not the GMT like facebook does
      timezone = extra_info.time_zone || extra_info.timezone
      if user.timezone.nil? && timezone.is_a?(String) && !timezone.is_integer?
        aux_timezone = ActiveSupport::TimeZone[timezone].to_s
        gmt_index = aux_timezone.to_s.index('GMT')+'GMT'.length
        timezone = aux_timezone[gmt_index..gmt_index+'00'.length].to_i
      end
      user.timezone = timezone if user.timezone.nil? && !timezone.nil?
      # /User attrs

      # Prevent Confirmation Email for SocialSession User LogIn
      user.confirmed_at = Time.now

      not_validate ? user.save(validate:false) : user.save
      user
    end
  end
end