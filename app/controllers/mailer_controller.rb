class MailerController < ApplicationController
	def status
		user = User.find params[:id]

		@name = user.name
  	@owned_projects = Project.owned_by(user).includes(:tasks)
  	@paricipate_projects = Project.executed_by(user).includes(:tasks) 
  	@paricipate_projects -= @owned_projects

  	render :file => 'user_mailer/status.html.haml', :layout => 'mail'
	end

	def send_status
		user = User.find params[:id]

		user.send_status_mail

		render nothing: true
	end
end
