class AddAvatarToPitches < ActiveRecord::Migration
  def change
    add_column :pitches, :avatar, :string
  end
end
