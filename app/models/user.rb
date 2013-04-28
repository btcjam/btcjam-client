class User < ActiveRecord::Base
  devise :omniauthable

  attr_accessible :email, :alias, :oauth_data


  def self.find_or_create_for_btcjam_oauth(oauth_data)

    User.find_or_initialize_by_btcjam_uid(oauth_data.uid).tap do |user|
      user.alias = oauth_data.info.alias
      user.oauth_data = oauth_data.to_json
      user.btcjam_uid = oauth_data.uid
    end
  end

  def update_btcjam_credentials(oauth_data)

    self.btcjam_access_token = oauth_data.credentials.token
    self.oauth_data = oauth_data.to_json
  end


  def oauth_info(tag)

    JSON.parse(self.oauth_data)["info"][tag] if self.oauth_data.present?
  end
end
