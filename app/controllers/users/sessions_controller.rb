class Users::SessionsController < Devise::SessionsController
 before_action :ensure_proper_subdomain, :only => "new"

  def ensure_proper_subdomain
    debugger
    #puts request
    #puts " pompomp "
   # if request.host_with_port != 'www.dotatrack.net'
   #   redirect_to params.merge({host: 'www.dotatrack.net'})
   # end
  end
end