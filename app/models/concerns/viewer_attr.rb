# Capability avatar methods
module ViewerAttr
  extend ActiveSupport::Concern

  def user_name
    self.user ? self.user.name : ''
  end
end