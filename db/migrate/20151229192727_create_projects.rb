class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      # Base Attrs
      t.integer :stage, null: false

      # Boolean attrs
      t.boolean :awards, null: false, default: false
      t.boolean :patent, null: false, default: false
      t.boolean :active, null: false, default: true

      # Associations (it relation can be both, but never none)
      t.belongs_to :pitch, index: true, foreign_key: true, null: true
      t.belongs_to :start_up, index: true, foreign_key: true, null: true

      t.timestamps null: false
    end
  end
end