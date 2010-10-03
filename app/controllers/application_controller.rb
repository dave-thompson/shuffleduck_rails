# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  helper :all # include all helpers, all the time
  protect_from_forgery # See ActionController::RequestForgeryProtection for details
  before_filter :verify_client
  filter_parameter_logging :password
  
  private
    def current_user_session
      return @current_user_session if defined?(@current_user_session)
      @current_user_session = UserSession.find
    end
    
    def current_user
      return @current_user if defined?(@current_user)
      @current_user = current_user_session && current_user_session.record
    end

    # these methods need updating to render errors - just returning false is no longer supported by rails to stop the subsequent action
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

    def verify_client
      @client_session = ClientSession.new()
      unless @client_session.save # if client session not successfully created using the api_key and signature, render an error and block the request
        @error = {:description => "Couldn't validate client application - please contact us at support@shuffleduck.com."}
        render :template => 'errors/error.xml.builder'
      end
    end

end
