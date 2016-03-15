class CreateCustomerFundings < ActiveRecord::Migration
  def change
    create_table :customer_fundings do |t|
      # Base Attributes
      t.string :tid, null: false
      t.string :status, limit: 20, null: false
      t.integer :amount, limit: 8, null: false
      t.string :payment_method, null: false
      t.text :response, limit: 16.kilobytes-1, null: true

      # Associations
      t.belongs_to :user, index: true, foreign_key: true, null: false
      t.belongs_to :pitch, index: true, foreign_key: true, null: false
      t.belongs_to :campaign, index: true, foreign_key: true, null: false
      t.belongs_to :supporter, index: true, foreign_key: true, null: false

      t.timestamps null: false
    end
  end
end
