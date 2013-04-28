class RemoveDoorkeeperAccessTokenFromUsers < ActiveRecord::Migration
  def up
    remove_column :users, :doorkeeper_access_token
  end

  def down
    add_column :users, :doorkeeper_access_token, :string
  end
end
