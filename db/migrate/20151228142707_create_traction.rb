class CreateTraction < ActiveRecord::Migration
  def change
    create_table :tractions do |t|
      # Base attributes
      t.string :grow_strategy, limit: 140, null: false
      t.decimal :lead_cust, precision: 5, scale: 2, null: true
      t.decimal :conversion_cust, precision: 5, scale: 2, null: true
      t.integer :amount_daily_lead, null: true
      t.integer :daily_growth_rate, null: true
      t.string :customer_channels, limit: 140, null: false

      t.boolean :active, null: false, default: true

      # Associations (it relation can be both, but never none)
      t.belongs_to :pitch, index: true, foreign_key: true, null: true
      t.belongs_to :start_up, index: true, foreign_key: true, null: true

      t.timestamps null: false
    end
  end
end
