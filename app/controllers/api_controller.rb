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
 
    if params[:api]=='listings' 
      @listings = SSLAccess::ssl_get("#{BTCJAM_APP_URL}/api/v1/#{params[:api]}", {:appid => BTCJAM_APP_ID, :secret => BTCJAM_APP_SECRET} )
    end

    render :json => @listings.to_json

  end

  def new_user_calls 
      @user = SSLAccess::ssl_post("#{BTCJAM_APP_URL}/api/v1/#{params[:api]}", :appid => BTCJAM_APP_ID, :secret => BTCJAM_APP_SECRET, 'user[email]'=>params[:username], 'user[password]'=>params[:password])
 
     render :json => @user.to_json
    
  end


  def new_id_calls
    post_hash = {  'identity_check[img_front]' => Faraday::UploadIO.new(params[:picture], 'image/jpeg'),
      'identity_check[img_back]' => Faraday::UploadIO.new(params[:picture_back], 'image/jpeg'),
      'identity_check[img_face]' => Faraday::UploadIO.new(params[:picture_face], 'image/jpeg'),
       'identity_check[name]'=>params[:name],'identity_check[dob]'=>params[:dob],'identity_check[gender]'=>params[:gender],'identity_check[nationalid]'=>params[:nationalid],'identity_check[nationalid_type_id]' => params[:nationalid_type_id]}
    @jret = client_token_multipart.request(:post, "#{BTCJAM_APP_URL}/api/v1/#{params[:api]}", { body: post_hash } ).parsed
   
    render :json => @jret
    
  end
  
  
  def new_addr_calls
    post_hash = {  'addr_check[img]' => Faraday::UploadIO.new(params[:picture], 'image/jpeg'),
       'addr_check[addr1]'=>params[:addr1],'addr_check[addr2]'=>params[:addr2],'addr_check[zip]'=>params[:zip],'addr_check[city]'=>params[:city],'addr_check[state]'=>params[:state],'addr_check[country]'=>params[:country], }
    @jret = client_token_multipart.request(:post, "#{BTCJAM_APP_URL}/api/v1/#{params[:api]}", { body: post_hash } ).parsed
    
    render :json => @jret
    
  end  
  
  
  def new_credit_calls 
    post_hash = {  'credit_check[proof_of_income_1]' => Faraday::UploadIO.new(params[:picture1], 'image/jpeg'), 
       'credit_check[ssn]'=>params[:ssn],
       'credit_check[annual_income]'=>params[:annual_income],'credit_check[employment_status_id]'=>params[:employment_status_id],'credit_check[credit_score]'=>params[:credit_score], }
    
    post_hash['credit_check[proof_of_income_2]'] = Faraday::UploadIO.new(params[:picture2], 'image/jpeg') if params[:picture2].present?
    post_hash['credit_check[proof_of_income_3]'] = Faraday::UploadIO.new(params[:picture3], 'image/jpeg') if params[:picture3].present?
   
    if !params[:car_ownership].nil?
        post_hash['credit_check[car_ownership]']='true'
    else
        post_hash['credit_check[car_ownership]']='false'
    end 
    
    if !params[:home_ownership].nil?
        post_hash['credit_check[home_ownership]']='true'
    else
        post_hash['credit_check[home_ownership]']='false'
    end  
    
    @jret = client_token_multipart.request(:post, "#{BTCJAM_APP_URL}/api/v1/#{params[:api]}", { body: post_hash } ).parsed
    
    render :json => @jret
    
  end  
  
 
end
