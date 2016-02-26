# Capability Teammates Aux methods
module TeammatesAssociations
  extend ActiveSupport::Concern

  # Teammates validations
  included do
    after_save :add_it_owner_as_teammate, if: :empty_team?
  end

  # Return teammates which have no pending
  def active_team
    self.teammates.where(verified: true)
  end

  # Before save/validate Pitch/Startup set it user owner as a teammate
  def add_it_owner_as_teammate
    self.teammates << Teammate.new(role: 'Owner', verified: true, permissions: 'admin', user_id: self.user_id)
    self.save
  end

  # Check if the team is empty (without the owner at least)
  def empty_team?
    self.teammates.length == 0
  end
end