class CreateProviders < ActiveRecord::Migration
  def change
    create_table :providers do |t|
      t.string :name, limit: 75, null: false
      t.string :segment, limit: 75, null: false
      t.string :provides, limit: 255, null: false
      t.string :counterpart, limit: 255, null: true

      # Associations
      t.belongs_to :pitch, index: true, foreign_key: true, null: false

      t.timestamps null: false
    end
  end
end
