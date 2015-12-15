# Capability security hash & validations methods
module Security
  extend ActiveSupport::Concern

  # Generate Invitation Code
  def invitation_code_gen
    re_tries = 0
    while true
      self.invite_key = Security::Encryptor.generate_id_hash_token re_tries
      User.where(invite_key: self.invite_key).take.nil? ? break : re_tries = re_tries+1
    end
  end
end