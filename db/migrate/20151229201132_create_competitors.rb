class CreateCompetitors < ActiveRecord::Migration
  def change
    create_table :competitors do |t|
      # Base attributes
      t.string :name, limit: 55, null: false
      t.decimal :price, precision: 5, scale: 2, null: true
      t.decimal :total_revenue, precision: 12, scale: 2, null: true
      t.integer :total_costumers, null: true
      t.string :success_stories, limit: 140, null: true
      t.string :bad_stories, limit: 140, null: true
      t.string :your_advantage, limit: 255, null: true
      t.boolean :active, null: false, default: true

      # Associations (it relation can be both, but never none)
      t.belongs_to :pitch, index: true, foreign_key: true, null: true
      t.belongs_to :start_up, index: true, foreign_key: true, null: true

      t.timestamps null: false
    end
  end
end