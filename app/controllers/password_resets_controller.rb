class PasswordResetsController < ApplicationController
  before_filter :load_user_using_perishable_token, :only => [ :edit, :update ]
  
  def create
    @user = User.find_by_email params[:password_reset][:email]
    if @user
      @user.deliver_password_reset_instructions!
      @status = "success"
    else
      @status = "fail"
      @message = "No user was found with that email address"
    end
    render :template =>'password_resets/create.xml.builder'
  end
    
  def edit
  end
  
  def update
    @user.password = params[:user][:password]
    if @user.save
      flash[:success] = "Password successfully updated"
      redirect_to "/"
    else
      render :action => :edit
    end
  end
  
  private
    def load_user_using_perishable_token
     @user = User.find_using_perishable_token(params[:id])
     unless @user
       flash[:error] = "We're sorry, but we could not locate your account"
       render :action => :edit
     end
    end
    
end