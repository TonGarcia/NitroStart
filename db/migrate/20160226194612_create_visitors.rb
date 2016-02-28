class CreateVisitors < ActiveRecord::Migration
  def change
    create_table :visitors do |t|
      # Base Attrs
      t.string :ip, limit: 35, null: false
      t.string :country, limit: 2, null: false
      t.string :device, limit: 140, null: false

      # Relation
      t.belongs_to :user, index: true, foreign_key: true, null: true
      t.belongs_to :campaign, index: true, foreign_key: true, null: false

      t.timestamps null: false
    end
  end
end