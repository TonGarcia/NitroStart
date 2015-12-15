# Capability legal numbers & data in general helper methods
module Profile
  extend ActiveSupport::Concern

  # Check if it profile is an admin
  def admin?
    self.id == 1
  end

  # Return it address as object
  def address
    address_hash = {}
    attrs = self.attributes

    address_attrs = [:zip_code, :name, :number, :complement, :timezone]
    user_address_attrs = [:zip_code, :address_name, :address_number, :address_complement, :timezone]

    user_address_attrs.each_with_index {|user_address_attr, i| address_hash[address_attrs[i]] = attrs[user_address_attr]}
    address_hash.to_obj
  end

  # Retrieve it social picture or default
  def picture
    # search for it picture on it social sessions
    self.social_sessions.each  {|social_session| return social_session.picture if social_session.picture}
    # return default picture
    'defaults/profile.jpg'
  end
end