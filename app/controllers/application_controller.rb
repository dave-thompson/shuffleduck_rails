# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  helper :all # include all helpers, all the time
  protect_from_forgery # See ActionController::RequestForgeryProtection for details
  #filter_parameter_logging :password
  
  private
    def current_user_session
      return @current_user_session if defined?(@current_user_session)
      @current_user_session = UserSession.find
    end
    
    def current_user
      return @current_user if defined?(@current_user)
      @current_user = current_user_session && current_user_session.record
    end
    
    def require_user # if no user is logged in, return false (block filtered method), else return nil (allow filtered method)
      unless current_user
        return false
      end
    end

    def require_no_user# if a user is logged in, return false (block filtered method), else return nil (allow filtered method)
      if current_user
        return false
      end
    end

end
