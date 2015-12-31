class CreateIdeas < ActiveRecord::Migration
  def change
    create_table :ideas do |t|
      # Main Problem it solve
      t.string :main_problem, limit: 55, null: false

      # Secondary problems solved
      t.string :second_problems, limit: 255, null: true

      # How does it fixed today?
      t.string :current_solution, limit: 140, null: true

      # One sell phrase (4 costumers)
      t.string :tag_line_pitch, limit: 140, null: true

      # One explanation phrase (4 investors)
      t.string :high_concept_pitch, limit: 140, null: true

      # Associations (it relation can be both, but never none)
      t.belongs_to :pitch, index: true, foreign_key: true, null: true
      t.belongs_to :start_up, index: true, foreign_key: true, null: true

      t.timestamps null: false
    end
  end
end