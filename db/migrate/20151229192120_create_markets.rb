class CreateMarkets < ActiveRecord::Migration
  def change
    create_table :markets do |t|
      # Base Attrs
      t.string :segment, limit: 75, null: false
      t.integer :currency_iso, null: false, default: 986
      t.integer :total_money, limit: 8, null: true
      t.integer :total_costumers, limit: 8, null: true
      t.string :trends_insight, limit: 140, null: true
      t.string :costumer_specification, limit: 255, null: true
      t.boolean :active, null: false, default: true

      # Associations (it relation can be both, but never none)
      t.belongs_to :pitch, index: true, foreign_key: true, null: true
      t.belongs_to :start_up, index: true, foreign_key: true, null: true

      t.timestamps null: false
    end
  end
end