class CreateProblems < ActiveRecord::Migration
  def change
    create_table :problems do |t|
      t.string :description
      t.belongs_to :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end