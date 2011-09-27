class UsersController < ApplicationController
  before_filter :require_no_user, :only => :create
  #  before_filter :require_user, :only => [:update, :destroy]
  
  # POST /users
  # POST /users.xml
  def create    
      @user = User.new(params[:user])
      if @user.save
        render :xml => @user, :status => :ok, :location => @user
      else
        render :xml => @user.errors, :status => :ok # hack to send back a 'created' status even though there was an error - this allows Flex to see the error messages (see http://stackoverflow.com/questions/2299401)
                                                    # another hack to change 'created' to 'ok' - all 'created' responses have been changed to 'ok' to workaround a bug in the windows flash player (see http://nachbar.name/blog/2008/06/14/flash-player-bug-with-ror-2httpservice-fires-fault-by-http-status-code-201/)
      end
  end

end
