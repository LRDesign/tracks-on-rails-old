# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  helper :all # include all helpers, all the time
  
  include AuthenticatedSystem  

  # See ActionController::RequestForgeryProtection for details
  # Uncomment the :secret if you're not using the cookie session store
  protect_from_forgery # :secret => '1a889547808dffca2796fcc318b6da89'
  
  # See ActionController::Base for details 
  # Uncomment this to filter the contents of submitted sensitive data parameters
  # from your application log (in this case, all fields with names like "password"). 
  # filter_parameter_logging :password

  def require_login
    if !logged_in?
      flash[:error] = "Please log in first."
      redirect_to login_url      
    end    
  end
  
  def require_admin
    if !admin_logged_in?
      flash[:error] = "You are not authorized to use this function."
      redirect_to :back
    end
  end
  
  def admin_logged_in?
    current_user.admin?
  end
  
end
