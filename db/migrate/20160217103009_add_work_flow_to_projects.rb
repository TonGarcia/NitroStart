class AddWorkFlowToProjects < ActiveRecord::Migration
  def change
    add_column :projects, :work_flow, :string, after: :id
  end
end