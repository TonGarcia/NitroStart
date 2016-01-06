class CreateBusinesses < ActiveRecord::Migration
  def change
    create_table :businesses do |t|
      # Base Attrs
      t.string :partnerships, limit: 140, null: true
      t.string :growth_metrics, limit: 255, null: false
      t.string :costumer_success_stories, limit: 255, null: true

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
