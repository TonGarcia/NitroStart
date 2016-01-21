class CreateCampaigns < ActiveRecord::Migration
  def change
    create_table :campaigns do |t|
      # Link to the campaign, like: up.nitrostart.com.br/my-campaign
      t.string :link, limit: 55, null: false
      # The campaign showing type (1 means visible attrs & 2 means body)
      t.integer :active_type, default: 1, null: false
      # Body is the Text Editor, like on other CrowdFunding
      t.text :body, limit: 64.kilobytes-1, null: true
      # Visible attrs means the default NITRO Campaign Layout
      t.text :visible_attrs, limit: 64.kilobytes-1, null: true

      # Associations (it relation can be both, but never none)
      t.belongs_to :pitch, index: true, foreign_key: true, null: true

      t.timestamps null: false
    end
  end
end