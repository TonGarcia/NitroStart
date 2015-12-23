module Helpers
  class OAuth
    # Create the user based on it omniauth object
    def self.from_omniauth(auth, current_user)
      # Help vars
      extra_info = auth.extra.raw_info
      extra_info = OmniAuth::AuthHash.new if extra_info.nil?
      auth_info = auth.info

      # Check if the auth & user exists
      social_session = SocialSession.where(provider: auth.provider, uid: auth.uid.to_s).first_or_initialize
      user = current_user || User.where("email = '#{auth_info.email}'").first || social_session.user || User.new

      # Persist the user & it social_session
      user = Concerns::SocialUser.persist user, auth, extra_info
      social_session = Concerns::SocialAuth.persist user, social_session, auth, extra_info

      # Return it user persisted for the social_session
      social_session.user
    end
  end
end