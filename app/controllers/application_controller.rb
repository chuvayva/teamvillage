class ApplicationController < ActionController::Base
  protect_from_forgery
	before_filter :authenticate_user!, :banned?
	before_filter ->(role){ @role = current_user.roles.first if current_user}

  def banned?
    if current_user.present? && current_user.blocked?
      sign_out current_user
      flash[:notice] = "This account has been blocked by admins"
      redirect_to new_user_session_path
      
    end
  end
end
