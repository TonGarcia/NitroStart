class CreatePitches < ActiveRecord::Migration
  def change
    create_table :pitches do |t|
      # The base project/pitch name
      t.string :name, limit: 30, null: false

      # Associations
      t.belongs_to :user, index: true, foreign_key: true, null: false

      t.timestamps null: false
    end
  end
end
