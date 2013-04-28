class RemoveDoorkeeperUidFromUsers < ActiveRecord::Migration
  def up
    remove_column :users, :doorkeeper_uid
  end

  def down
    add_column :users, :doorkeeper_uid, :integer
  end
end
