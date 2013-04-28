class AddOauthDataToUsers < ActiveRecord::Migration
  def change
    add_column :users, :oauth_data, :text
  end
end
