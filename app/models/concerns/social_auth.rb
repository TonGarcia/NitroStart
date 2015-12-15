# Easy encapsulated persistence
module Concerns
  class SocialAuth
    extend ActiveSupport::Concern
    # Helper to persist the Social_session
    def self.persist(user, social_session, auth, extra_info)
      auth_info = auth.info
      not_validate = (auth.provider == 'twitter' || auth.provider == 'instagram')

      # Social_session attrs
      social_session.uid = extra_info.id || auth.uid
      social_session.name = auth_info.name
      social_session.username = extra_info.username || extra_info.screen_name || auth_info.nickname
      social_session.email = extra_info.email || extra_info.emailAddress
      social_session.picture = auth_info.image || extra_info.profile_image_url_https || extra_info.profile_image_url

      # SocialNetwork
      social_session.provider = auth.provider
      social_network = Helpers::Enum.find(:social_networks, :auth_gem, social_session.provider)
      social_session.social_network = social_network[:index]
      social_session.user_id = user.id
      social_session.token = auth.credentials.token
      social_session.secret = auth.credentials.secret
      social_session.expires_at = auth.credentials.expires_at

      # Save it social session
      not_validate ? social_session.save(validate:false) : social_session.save

      # Additional infos logic
      auth_infos = AdditionalInfo.where(social_session: social_session.id)
      extra_info.keys.each do |key|
        value = extra_info[key]

        current_info = nil
        auth_infos.each do |info|
          if info.key == key
            current_info = info
            break
          end
        end

        value = value.to_json unless value.is_a?String
        current_info.nil? ? social_session.additional_infos << AdditionalInfo.new(key: key, value: value) : current_info.update(value: value)
      end

      not_validate ? social_session.save(validate:false) : social_session.save
      social_session
    end
  end
end