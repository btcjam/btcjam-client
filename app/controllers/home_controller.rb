class HomeController < ApplicationController
  
  def index 
    if signed_in?
      
      @statuses = SSLAccess::ssl_get("#{BTCJAM_APP_URL}/employment_statuses.json" )
      @nationalid_types = SSLAccess::ssl_get("#{BTCJAM_APP_URL}/nationalid_types.json" )
      
    end
  end
end
