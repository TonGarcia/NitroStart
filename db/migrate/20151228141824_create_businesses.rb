class CreateBusinesses < ActiveRecord::Migration
  def change
    create_table :businesses do |t|
      # Base Attrs
      t.string :partnerships, limit: 140, null: true
      t.string :revenue_model, limit: 255, null: false
      t.string :value_proposition, limit: 140, null: true
      t.string :advantages, limit: 255, null: false
      t.string :disadvantages, limit: 255, null: false
      t.string :customer_success_stories, limit: 255, null: true
      t.decimal :main_product_price, precision: 7, scale: 2, default: 0, null: false
      t.boolean :active, null: false, default: true

      # Associations
      t.belongs_to :pitch, index: true, foreign_key: true, null: false

      t.timestamps null: false
    end
  end
end