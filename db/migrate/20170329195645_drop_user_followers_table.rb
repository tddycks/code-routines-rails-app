class DropUserFollowersTable < ActiveRecord::Migration
  def change
    drop_table :user_followers
  end
end
