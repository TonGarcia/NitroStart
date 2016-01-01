class CreateTraction < ActiveRecord::Migration
  def change
    create_table :traction do |t|
      # Base attributes
      t.string :growth_rate, limit: 45, null: true
      t.string :grow_strategy, limit: 140, null: true
      t.string :conversion_rate, limit: 45, null: true
      t.string :market_meet_channel, limit: 140, null: false

      # Associations (it relation can be both, but never none)
      t.belongs_to :pitch, index: true, foreign_key: true, null: false
      t.belongs_to :start_up, index: true, foreign_key: true, null: false

      t.timestamps null: false
    end
  end
end
