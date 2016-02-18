class CreateCampaigns < ActiveRecord::Migration
  def change
    create_table :campaigns do |t|
      # Link to the campaign, like: up.nitrostart.com.br/my-campaign
      t.string :link, limit: 55, null: false
      # Body is the Text Editor, like any other CrowdFunding
      t.text :body, limit: 64.kilobytes-1, null: true
      # Locale Campaign (like: pt, br, it... ISO 3166)
      t.column :locale, 'char(2)', null: false

      # Associations (it relation can be both, but never none)
      t.belongs_to :pitch, index: true, foreign_key: true, null: true
      t.belongs_to :start_up, index: true, foreign_key: true, null: true

      t.timestamps null: false
    end
  end
end