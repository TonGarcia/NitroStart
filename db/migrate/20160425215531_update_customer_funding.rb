class UpdateCustomerFunding < ActiveRecord::Migration
  def change
    change_column :customer_fundings, :supporter_id, :integer, null: true
  end
end