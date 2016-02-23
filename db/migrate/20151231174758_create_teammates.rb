class CreateTeammates < ActiveRecord::Migration
  def change
    create_table :teammates do |t|
      # Base attributes
      t.string :role, limit: 45, null: false
      t.boolean :verified, default: false, null: false
      t.string :permissions, limit: 75, default: 'none', null: false

      # Fixed Association
      t.belongs_to :user, index: true, foreign_key: true, null: false

      # Custom Association
      t.belongs_to :pitch, index: true, foreign_key: true, null: true
      t.belongs_to :start_up, index: true, foreign_key: true, null: true

      t.timestamps null: false
    end
  end
end