class UsersController < ApplicationController
  
  load_and_authorize_resource

  responders :flash
  respond_to :html, :json

  def index
    respond_with @users 
  end

  def show
    respond_with @user 
  end

  def edit
  end

  def update
    params[:user][:roles] ||= []
    @user.update_attributes(params[:user])
    respond_with @user
  end

  def destroy
    @user.destroy
    respond_with @user
  end

   def user_tasks
  	@viewed_tasks = current_user.executing_tasks
  end
end
