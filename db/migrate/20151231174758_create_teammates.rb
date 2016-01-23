class CreateTeammates < ActiveRecord::Migration
  def change
    create_table :teammates do |t|
      # Base attributes
      t.string :role
      t.string :expertise
      t.boolean :contacts

      # Fixed Association
      t.belongs_to :user, index: true, foreign_key: true, null: false

      # Custom Association
      t.belongs_to :pitch, index: true, foreign_key: true, null: true
      t.belongs_to :start_up, index: true, foreign_key: true, null: true

      t.timestamps null: false
    end
  end
end