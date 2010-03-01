class UsersController < ApplicationController
  before_filter :require_no_user, :only => :create
  #  before_filter :require_user, :only => [:update, :destroy]
  
  # POST /users
  # POST /users.xml
  def create    
      @user = User.new(params[:user])
      if @user.save
        render :xml => @user, :status => :created, :location => @user
      else
        render :xml => @user.errors, :status => :created # hack to send back a 'created' status even though there was an error - this allows Flex to see the error messages (see http://stackoverflow.com/questions/2299401)
      end
  end

end
