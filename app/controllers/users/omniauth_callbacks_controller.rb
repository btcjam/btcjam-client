class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def btcjam
    oauth_data = request.env["omniauth.auth"]

    @user = User.find_or_create_for_btcjam_oauth(oauth_data)
    @user.update_btcjam_credentials(oauth_data)
    @user.save

    sign_in_and_redirect @user
  end
end
