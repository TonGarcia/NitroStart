class AddPitchCover < ActiveRecord::Migration
  def self.up
    change_table :pitches do |t|
      t.attachment :cover, after: :name
    end
  end

  def self.down
    remove_attachment :pitches, :cover
  end
end