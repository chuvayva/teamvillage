class UserMailer < ActionMailer::Base
  default from: "from@example.com"

  def status(user)
  	@name = user.name
  	@owned_projects = Project.owned_by(user).includes(:tasks)
  	@paricipate_projects = Project.executed_by(user).includes(:tasks) 
  	@paricipate_projects -= @owned_projects
  	
  	mail to: user.email, subject: 'Projects status'
  end
end
