class AddAvatarToPitches < ActiveRecord::Migration
  def change
    add_column :pitches, :avatar, :string, after: :id
  end
end
