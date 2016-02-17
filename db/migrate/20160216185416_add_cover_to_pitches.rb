class AddCoverToPitches < ActiveRecord::Migration
  def change
    add_column :pitches, :cover, :string
  end
end
