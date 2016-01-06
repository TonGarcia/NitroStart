class CreateCompetitors < ActiveRecord::Migration
  def change
    create_table :competitors do |t|
      # Base attributes
      t.string :name, limit: 55, null: false
      t.string :success_story, limit: 140, null: true
      t.string :your_advantage, limit: 255, null: false
      t.boolean :active, null: false, default: true

      # Associations (it relation can be both, but never none)
      t.belongs_to :pitch, index: true, foreign_key: true, null: true
      t.belongs_to :start_up, index: true, foreign_key: true, null: true

      t.timestamps null: false
    end
  end
end
