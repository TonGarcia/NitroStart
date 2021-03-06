class CreateIdeas < ActiveRecord::Migration
  def change
    create_table :ideas do |t|
      # Main Problem it solve
      t.string :main_problem, limit: 90, null: false

      # Secondary problems solved
      t.string :second_problems, limit: 400, null: true

      # How does it fixed today?
      t.string :current_solution, limit: 140, null: true

      # One sell phrase (for customers)
      t.string :tag_line_pitch, limit: 75, null: true

      # One explanation phrase (for investors)
      t.string :high_concept_pitch, limit: 75, null: true

      # One explanation phrase (for investors)
      t.string :why_must_success, limit: 140, null: false

      # One explanation phrase (for investors)
      t.string :how_validate, limit: 140, null: true
      t.boolean :active, null: false, default: true

      # Associations
      t.belongs_to :pitch, index: true, foreign_key: true, null: false

      t.timestamps null: false
    end
  end
end