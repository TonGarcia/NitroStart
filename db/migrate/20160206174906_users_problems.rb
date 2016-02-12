class UsersProblems < ActiveRecord::Migration
  def change
    create_join_table :users, :problems
  end
end