class CreateSupporters < ActiveRecord::Migration
  def change
    create_table :supporters do |t|
      # Base Attrs
      # It default 1 means customer, but it can be programmer, designers...
      t.integer :role, null: false, default: 1

      # Scaffold Attributes
      t.string :feedback_type, limit: 20, null: false
      t.decimal :how_much_pays, precision: 15, scale: 2, null: true
      t.string :positive_feedback, limit: 255, null: true
      t.string :negative_feedback, limit: 255, null: true

      # Associations
      t.belongs_to :user, index: true, foreign_key: true, null: false
      t.belongs_to :pitch, index: true, foreign_key: true, null: false
      t.belongs_to :campaign, index: true, foreign_key: true, null: false

      t.timestamps null: false
    end
  end
end