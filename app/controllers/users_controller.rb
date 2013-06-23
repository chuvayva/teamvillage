class UsersController < ApplicationController

  def show
  	# @user = current_user
  end

  def user_tasks
  	@viewed_tasks = current_user.executing_tasks
  end
end
