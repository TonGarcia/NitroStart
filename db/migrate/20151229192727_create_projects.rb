class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      # Base Attrs
      t.integer :stage, null: false

      # Source Attrs
      t.string :award_source, limit: 255, null: true
      t.string :patent_source, limit: 255, null: true

      # Boolean attrs
      t.boolean :awards, null: false, default: false
      t.boolean :patent, null: false, default: false
      t.boolean :active, null: false, default: true

      # Associations
      t.belongs_to :pitch, index: true, foreign_key: true, null: false

      t.timestamps null: false
    end
  end
end