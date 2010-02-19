class UsersController < ApplicationController
  before_filter :require_no_user, :only => :create
  #  before_filter :require_user, :only => [:update, :destroy]
  
  # POST /users
  # POST /users.xml
  def create
    
    # check for problems with the user's requested account details
    username_clash = true if User.find_by_username(params[:user][:username])
    inappropriate_password = true if ((params[:user][:password].length < 6)||(params[:user][:password].length > 30))
    inappropriate_username = true if ((params[:user][:password].length < 6)||(params[:user][:password].length > 30)||!(params[:user][:username] =~ /\A\w[\w\.+\-_]+\Z/))
    age_not_supplied = true if (params[:user][:age_at_signup] == "null")
    
    # set description of any error (priority is from bottom up)
    description = "Please choose your age from the drop down list." if age_not_supplied
    description = "Please choose a password between 6 and 30 characters." if inappropriate_password
    description = "Sorry. That username already exists." if username_clash
    description = "Please choose a username between 3 and 30 characters and using only letters, numbers and .-_ please." if inappropriate_username

    # return error if there was one, otherwise create and return the new user
    if description
      @error = {:logon_succeeded => false, :username_clash => username_clash, :inappropriate_password => inappropriate_password, :inappropriate_username => inappropriate_username, :age_not_supplied => age_not_supplied, :description => description}
      render :template => 'users/error.xml.builder'
    else
      @user = User.new(params[:user])
      if @user.save
        render :xml => @user, :status => :created, :location => @user
      else
        @error = {:logon_succeeded => false, :username_clash => false, :inappropriate_password => false, :age_not_supplied => false, :description => "Sorry. ShuffleDuck is having problems. Please try again and let us know if this continues."}
        render :template => 'users/error.xml.builder'
      end
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
