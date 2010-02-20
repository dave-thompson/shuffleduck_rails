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

=begin
  # PUT /users/1
  # PUT /users/1.xml
  def update
    @user = User.find(params[:id])

    respond_to do |format|
      if @user.update_attributes(params[:user])
        flash[:notice] = 'User was successfully updated.'
        format.html { redirect_to(@user) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @user.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.xml
  def destroy
    @user = User.find(params[:id])
    @user.destroy

    respond_to do |format|
      format.html { redirect_to(users_url) }
      format.xml  { head :ok }
    end
  end
=end

end
