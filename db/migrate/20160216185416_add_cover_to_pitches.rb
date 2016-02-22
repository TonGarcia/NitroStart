class AddCoverToPitches < ActiveRecord::Migration
  def change
    add_column :pitches, :cover, :string, after: :id
  end
end
