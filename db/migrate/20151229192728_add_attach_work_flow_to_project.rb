class AddAttachWorkFlowToProject < ActiveRecord::Migration
  def self.up
    change_table :projects do |t|
      t.attachment :work_flow, after: :stage
    end
  end

  def self.down
    remove_attachment :projects, :work_flow
  end
end