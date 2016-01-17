class AddPitchAvatar < ActiveRecord::Migration
  def self.up
    change_table :pitches do |t|
      t.attachment :avatar, after: :name
    end
  end

  def self.down
    remove_attachment :pitches, :avatar
  end
end
