class CreatePageViews < ActiveRecord::Migration
  def change
    create_table :page_views do |t|
      # Attributes
      t.string :ip, limit: 30, null: false
      t.string :url, limit: 140, null: false
      t.string :locale, limit: 45, null: true
      t.string :device, limit: 75, null: true
      t.string :browser, limit: 50, null: true

      # Reference to prevent count recurrent user, cookie_id = nested_page_view_id
      t.integer :cookie_id, null: true

      # Associations
      t.belongs_to :user, index: true, foreign_key: true, null: true
      t.belongs_to :campaign, index: true, foreign_key: true, null: false
      t.belongs_to :supporter, index: true, foreign_key: true, null: true
      t.timestamps null: false
    end
  end
end