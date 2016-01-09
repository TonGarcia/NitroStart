class CreateSupporters < ActiveRecord::Migration
  def change
    create_table :supporters do |t|
      # Base Attrs
      # It default 1 means costumer, but it can be programmer, designers...
      t.integer :role, null: false, default: 1

      # Associations (it relation can be both, but never none)
      t.belongs_to :pitch, index: true, foreign_key: true, null: true
      t.belongs_to :start_up, index: true, foreign_key: true, null: true

      t.timestamps null: false
    end
  end
end