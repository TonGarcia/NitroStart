class CreateAdditionalInfos < ActiveRecord::Migration
  def change
    create_table :additional_infos do |t|
      # Base attrs
      t.string :key, limit: 40, null: false
      t.text :value, limit: 64.kilobytes-1, null: true

      # Associations (only one each time, not both)
      t.belongs_to :remote_client, index: true, null: true
      t.belongs_to :social_session, index: true, null: true

      t.timestamps null: false
    end
  end
end