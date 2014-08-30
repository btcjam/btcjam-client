module SSLAccess
  require "net/http"

  def self.ssl_get(url, params = {})

  begin
    uri = URI(url)
    req = Net::HTTP::Get.new(uri.request_uri)
    
    req.set_form_data(params)

    res = Net::HTTP.start(uri.host, uri.port, :ssl_version  => "SSLv3", :use_ssl => uri.scheme == 'https', :verify_mode => OpenSSL::SSL::VERIFY_NONE) do |https|
     https.read_timeout = 3
      https.request(req)
    end

    JSON.load(res.body)
   rescue
     nil
   end
  end

  def self.ssl_post(url, params)
    
  begin
    uri = URI(url)
    req = Net::HTTP::Post.new(uri.path) 
    req.set_form_data(params)


    res = Net::HTTP.start(uri.host, uri.port, :ssl_version  => "SSLv3", :use_ssl => uri.scheme == 'https', :verify_mode => OpenSSL::SSL::VERIFY_NONE) do |https|
       https.read_timeout = 3
      https.request(req)
    end

    JSON.load(res.body)
   rescue
     nil
   end
  end

end