class CreateRevenues < ActiveRecord::Migration
  def change
    create_table :revenues do |t|
      # Base attributes
      t.decimal :price, precision: 5, scale: 2, default: 0, null: false
      t.integer :model, null: false # From Enum YML
      t.boolean :active, null: false, default: true

      # Associations (it relation can be both, but never none)
      t.belongs_to :pitch, index: true, foreign_key: true, null: false
      t.belongs_to :start_up, index: true, foreign_key: true, null: false

      t.timestamps null: false
    end
  end
end
