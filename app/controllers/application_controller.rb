class ApplicationController < ActionController::Base
  protect_from_forgery

  def btcjam_oauth_client
    @client ||= OAuth2::Client.new(BTCJAM_APP_ID, BTCJAM_APP_SECRET, :site => BTCJAM_APP_URL)
  end

  def btcjam_access_token
    @token ||= OAuth2::AccessToken.new(btcjam_oauth_client, current_user.btcjam_access_token) if current_user
  end
end
