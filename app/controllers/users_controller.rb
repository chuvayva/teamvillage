class UsersController < ApplicationController
	before_filter :authenticate_user!

  def show
  	# @user = current_user
  end

  def user_tasks
  	
  end
end
