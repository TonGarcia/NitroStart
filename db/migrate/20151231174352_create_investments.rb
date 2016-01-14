class CreateInvestments < ActiveRecord::Migration
  def change
    create_table :investments do |t|
      # Base Attributes
      t.integer :general_terms, null: false
      t.integer :raising_time, null: true
      t.decimal :founder_salaries, precision: 5, scale: 2, default: 0, null: false
      t.decimal :costumer_conversion, precision: 5, scale: 2, default: 0, null: false
      t.decimal :product_development, precision: 7, scale: 2, default: 0, null: false
      t.decimal :equipments, precision: 5, scale: 2, default: 0, null: false
      t.boolean :active, null: false, default: true

      # Associations (it relation can be both, but never none)
      t.belongs_to :start_up, index: true, foreign_key: true, null: true

      t.timestamps null: false
    end
  end
end