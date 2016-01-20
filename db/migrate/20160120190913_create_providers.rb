class CreateProviders < ActiveRecord::Migration
  def change
    create_table :providers do |t|
      t.string :name, limit: 75, null: false
      t.string :segment, limit: 75, null: false
      t.string :provides, limit: 255, null: false
      t.string :counterpart, limit: 255, null: true

      # Associations (it relation can be both, but never none)
      t.belongs_to :pitch, index: true, foreign_key: true
      t.belongs_to :start_up, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
