class UsersController < ApplicationController

  def show
  	# @user = current_user
  end

  def user_tasks
  	@all_user_tasks = Task.where("executer_id = ?", current_user)
  end
end
