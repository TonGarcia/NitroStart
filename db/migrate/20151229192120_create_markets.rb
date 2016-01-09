class CreateMarkets < ActiveRecord::Migration
  def change
    create_table :markets do |t|
      # Base Attrs
      t.string :segment, limit: 75, null: false, default: 986
      t.integer :currency_iso, null: false, default: 986
      t.integer :total_money, null: false
      t.integer :total_costumers, null: false
      t.string :trends_insight, limit: 140, null: true
      t.string :costumer_specification, limit: 140, null: false
      t.boolean :active, null: false, default: true

      # Associations (it relation can be both, but never none)
      t.belongs_to :pitch, index: true, foreign_key: true, null: true
      t.belongs_to :start_up, index: true, foreign_key: true, null: true

      t.timestamps null: false
    end
  end
end