class CreateMarkets < ActiveRecord::Migration
  def change
    create_table :markets do |t|
      # Base Attrs
      t.string :segment, limit: 75, null: false
      t.integer :currency_iso, null: false, default: 986
      t.integer :total_money, limit: 8, null: true
      t.string :money_source_link, limit: 255, null: true
      t.integer :total_customers, limit: 8, null: true
      t.string :customers_source_link, limit: 255, null: true
      t.string :trends_insight, limit: 140, null: true
      t.string :customer_specification, limit: 255, null: true
      t.boolean :active, null: false, default: true

      # Associations
      t.belongs_to :pitch, index: true, foreign_key: true, null: false

      t.timestamps null: false
    end
  end
end