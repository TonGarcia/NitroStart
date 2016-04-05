class CreatePitches < ActiveRecord::Migration
  def change
    create_table :pitches do |t|
      # The base project/pitch name
      t.string :name, limit: 55, null: false
      # Pitch brand/logo
      t.string :avatar
      # Changeable only by Admin User
      t.boolean :technical_validation

      # Associations
      t.belongs_to :user, index: true, foreign_key: true, null: false
      t.timestamps null: false
    end
  end
end