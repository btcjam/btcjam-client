class AddBtcjamAccessTokenToUsers < ActiveRecord::Migration
  def change
    add_column :users, :btcjam_access_token, :string
  end
end
