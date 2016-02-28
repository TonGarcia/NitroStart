class CreateCampaigns < ActiveRecord::Migration
  def change
    create_table :campaigns do |t|
      # Link to the campaign, like: up.nitrostart.me/my-campaign
      t.string :link, limit: 55, unique: true, null: false
      # Locale Campaign (like: pt, br, it... ISO 3166)
      t.column :locale, 'char(2)', null: false
      # Body is the Text Editor, like any other CrowdFunding
      t.text :body, limit: 64.kilobytes-1, null: true

      # Associations
      t.belongs_to :pitch, index: true, foreign_key: true, null: false

      t.timestamps null: false
    end
  end
end