class AddIdeaToCampaign < ActiveRecord::Migration
  def change
    add_reference :campaigns, :idea, index: true, null: false
  end
end