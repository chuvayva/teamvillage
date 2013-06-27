class SessionsController < Devise::SessionsController

protected

  def after_sign_in_path_for(resource)
    if resource.is_a?(User) && resource.blocked?
      sign_out resource
      flash[:notice] = "This account has been blocked by admin"
      sign_in_path
    else
      super
    end
   end

end