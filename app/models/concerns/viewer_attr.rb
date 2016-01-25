# Capability avatar methods
module ViewerAttr
  extend ActiveSupport::Concern

  def user_viewer
    self.user.name
  end
end