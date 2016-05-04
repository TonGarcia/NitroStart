class UpdateSupporterUserIdNull < ActiveRecord::Migration
  def up
    change_column :supporters, :user_id, :integer, null: true
  end

  def down
    change_column :supporters, :user_id, :integer, null: true
  end
end