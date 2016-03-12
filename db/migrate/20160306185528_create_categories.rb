class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      # Category name is a system_name to refer on locales
      t.string :name, limit: 100, null: false

      # It means sub-categories if present
      t.belongs_to :category, index: true, foreign_key: true, null: true

      t.timestamps null: false
    end
  end
end