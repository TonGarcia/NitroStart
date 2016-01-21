class CreateCampaigns < ActiveRecord::Migration
  def change
    create_table :campaigns do |t|
      t.string :link
      t.text :visible_attrs
      t.text :body

      t.timestamps null: false
    end
  end
end
