class CreateFinancial < ActiveRecord::Migration
  def change
    create_table :financials do |t|
      # Base attributes
      t.integer :total_users, null: false
      t.integer :total_customers, null: true
      t.decimal :total_revenue, precision: 12, scale: 2, null: true
      t.decimal :total_expense, precision: 10, scale: 2, null: true
      t.decimal :bootstrapped, precision: 10, scale: 2, null: true
      t.integer :market_penetration, null: true
      t.boolean :active, null: false, default: true

      # Associations
      t.belongs_to :pitch, index: true, foreign_key: true, null: false

      t.timestamps null: false
    end
  end
end