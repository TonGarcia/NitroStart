class UpdateCustomerFunding < ActiveRecord::Migration
  def up
    change_column :customer_fundings, :supporter_id, :integer, null: true
  end

  def down
    change_column :customer_fundings, :supporter_id, :integer, null: true
  end
end