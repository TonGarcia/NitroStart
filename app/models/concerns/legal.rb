# Capability legal numbers & data in general helper methods
module Legal
  extend ActiveSupport::Concern

  # validate person legal_id (CPF in Brazil case)
  def legal_person_id_format
    unless CPF.new(self.legal_id).valid?
      self.errors.add(:legal_id, 'must be a valid CPF')
      raise ActiveRecord::Rollback
    end
  end
end