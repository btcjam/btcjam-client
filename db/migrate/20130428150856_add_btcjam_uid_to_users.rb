class AddBtcjamUidToUsers < ActiveRecord::Migration
  def change
    add_column :users, :btcjam_uid, :integer
  end
end
