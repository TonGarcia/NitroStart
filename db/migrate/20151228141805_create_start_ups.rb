class CreateStartUps < ActiveRecord::Migration
  def change
    create_table :start_ups do |t|
      # The base project/pitch name
      t.string :name, limit: 45, null: false
      t.integer :equity_requested, null: false

      # Associations
      t.belongs_to :pitch, index: true, foreign_key: true, null: false

      t.timestamps null: false
    end
  end
end
