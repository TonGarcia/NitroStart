class CreateStartupPitches < ActiveRecord::Migration
  def change
    create_table :startup_pitches do |t|
      # Attrs
      t.boolean :active

      # Associations
      t.belongs_to :pitch, index: true, foreign_key: true, null: false
      t.belongs_to :start_up, index: true, foreign_key: true, null: false

      # Associations
      t.timestamps null: false
    end
  end
end