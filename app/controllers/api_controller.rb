class ApiController < ApplicationController
  include SSLAccess
  respond_to :json

  def authenticated_calls

    @json = btcjam_access_token.get("api/v1/#{params[:api]}").parsed
    render :json => @json
  end

  def invest_call

    @json = btcjam_access_token.post("api/v1/#{params[:api]}").parsed
    render :json => @json
  end

  def open_calls

    @listings = SSLAccess::ssl_get("#{BTCJAM_APP_URL}/api/v1/#{params[:api]}", {:appid => BTCJAM_APP_ID, :secret => BTCJAM_APP_SECRET} )


    render :json => @listings.to_json

  end

end
