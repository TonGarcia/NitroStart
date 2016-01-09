class CreateTeammates < ActiveRecord::Migration
  def change
    create_table :teammates do |t|
      t.string :role
      t.string :expertise
      t.boolean :contacts
      t.belongs_to :team, index: true, foreign_key: true
      t.belongs_to :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end