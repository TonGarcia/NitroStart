class CreateSocialSessions < ActiveRecord::Migration
  def change
    create_table :social_sessions do |t|
      # Base attrs
      t.string :uid, limit: 65, null: false
      t.string :name, limit: 60, null: false
      t.string :email, limit: 60, null: true
      t.string :username, limit: 60, null: true
      t.string :picture, limit: 150, null: true

      # Remote attrs & refs
      t.string :token, limit: 255, null: false
      t.string :provider, limit: 50, null: false
      t.integer :social_network, null: false
      t.string :secret, limit: 255, null: true
      t.datetime :expires_at, null: true

      # Associations
      t.belongs_to :user, index: true, foreign_key: true, null: false

      t.timestamps null: false
    end
  end
end