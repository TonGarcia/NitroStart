class CreateCompetitors < ActiveRecord::Migration
  def change
    create_table :competitors do |t|
      # Base attributes
      t.string :name, limit: 55, null: false
      t.decimal :price, precision: 8, scale: 2, null: true
      t.decimal :total_revenue, precision: 15, scale: 2, null: true
      t.integer :total_customers, null: true
      t.string :success_stories, limit: 140, null: true
      t.string :bad_stories, limit: 140, null: true
      t.string :your_advantage, limit: 255, null: true
      t.boolean :active, null: false, default: true

      # Associations
      t.belongs_to :pitch, index: true, foreign_key: true, null: false

      t.timestamps null: false
    end
  end
end