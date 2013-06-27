class ApplicationController < ActionController::Base
  protect_from_forgery
	before_filter :authenticate_user!
	before_filter ->(role){ @role = current_user.roles.first if current_user}
end
