class ApplicationController < ActionController::Base
  protect_from_forgery

  def btcjam_oauth_client
    @client ||= OAuth2::Client.new(BTCJAM_APP_ID, BTCJAM_APP_SECRET, {:site => BTCJAM_APP_URL, :peppa=>'pig'})
  end

  def btcjam_access_token
    @token ||= OAuth2::AccessToken.new(btcjam_oauth_client, current_user.btcjam_access_token, {:maroto => 'pom'}) if current_user
  end
  
  def client_token_multipart
    OAuth2::AccessToken.new(client_multipart, current_user.btcjam_access_token)
  end
  
  def client_multipart
    OAuth2::Client.new(BTCJAM_APP_ID, BTCJAM_APP_SECRET, site: BTCJAM_APP_URL) do |builder|
      builder.use Faraday::Request::Multipart
      builder.use Faraday::Adapter::NetHttp
    end
  end
  
end
