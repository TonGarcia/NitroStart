class CreateSupporters < ActiveRecord::Migration
  def change
    create_table :supporters do |t|
      # Base Attrs
      # It default 1 means customer, but it can be programmer, designers...
      t.integer :role, null: false, default: 1

      # Scaffold Attributes
      t.decimal :how_much_pays, precision: 15, scale: 2, null: true
      t.boolean :pay_the_expected, null: false
      t.string :positive_feedback, limit: 255, null: true
      t.string :negative_feedback, limit: 255, null: true

      # Associations (it relation can be both, but never none)
      t.belongs_to :pitch, index: true, foreign_key: true, null: true
      t.belongs_to :start_up, index: true, foreign_key: true, null: true

      t.timestamps null: false
    end
  end
end