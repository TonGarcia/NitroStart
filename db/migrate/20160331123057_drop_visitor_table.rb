class DropVisitorTable < ActiveRecord::Migration
  def change
    drop_table :visitors
  end
end