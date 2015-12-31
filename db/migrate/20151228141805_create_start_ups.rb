class CreateStartUps < ActiveRecord::Migration
  def change
    create_table :start_ups do |t|
      t.string :name, limit: 45, null: false
      t.belongs_to :pitch, index: true, foreign_key: true, null: false

      t.timestamps null: false
    end
  end
end
