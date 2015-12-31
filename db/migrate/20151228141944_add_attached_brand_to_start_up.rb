class AddAttachedBrandToStartUp < ActiveRecord::Migration
  def self.up
    change_table :start_ups do |t|
      t.attachment :brand, after: :name
    end
  end

  def self.down
    remove_attachment :start_ups, :brand
  end
end