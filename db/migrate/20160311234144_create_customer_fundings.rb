class CreateCustomerFundings < ActiveRecord::Migration
  def change
    create_table :customer_fundings do |t|
      # Base Attributes
      t.string :tid, null: false
      t.integer :status, null: false
      t.integer :amount, precision: 6, scale: 2, null: false
      t.string :response, null: false

      # Associations
      t.belongs_to :user, index: true, foreign_key: true
      t.belongs_to :pitch, index: true, foreign_key: true
      t.belongs_to :campaign, index: true, foreign_key: true
      t.belongs_to :supporter, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
