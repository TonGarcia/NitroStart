class CreateTeams < ActiveRecord::Migration
  def change
    create_table :teams do |t|
      t.belongs_to :pitch, index: true, foreign_key: true
      t.belongs_to :start_up, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end