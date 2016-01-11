class CreateFinancial < ActiveRecord::Migration
  def change
    create_table :financials do |t|
      # Base attributes
      t.integer :total_user, null: false
      t.integer :total_costumer, null: true
      t.decimal :total_revenue, precision: 12, scale: 2, null: true
      t.decimal :total_expense, precision: 10, scale: 2, null: true
      t.integer :market_penetration, null: true
      t.boolean :active, null: false, default: true

      # Associations (it relation can be both, but never none)
      t.belongs_to :pitch, index: true, foreign_key: true, null: true
      t.belongs_to :start_up, index: true, foreign_key: true, null: true

      t.timestamps null: false
    end
  end
end