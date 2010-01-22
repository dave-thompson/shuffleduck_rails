class UserSessionsController < ApplicationController
  #before_filter :require_no_user, :only => :create # removed this filter - it was causing problems
  before_filter :require_user, :only => :destroy
  
  def create
    @user_session = UserSession.new(params[:user_session])
    if @user_session.save
      render :xml => current_user, :status => :created, :location => current_user
    else
      render :xml => @user_session.errors, :status => :unprocessable_entity
    end
  end
  
  def show
    if current_user_session
      render :xml => current_user, :status => :created, :location => current_user
    else
      head :ok
    end
  end
  
  def destroy
    current_user_session.destroy
    head :ok
  end
  
end