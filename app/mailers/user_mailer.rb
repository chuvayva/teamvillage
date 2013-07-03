class UserMailer < ActionMailer::Base
  default from: "from@example.com"

  def status(user)
  	@name = user.name
  	@owned_projects = Project.owned_by(user).includes(:tasks)
  	@paricipate_projects = Project.executed_by(user).includes(:tasks) 
  	@paricipate_projects -= @owned_projects
  	
  	html = render_to_string(template: 'user_mailer/status', layout: 'mail',locals: { :@name => @name, :@owned_projects => @owned_projects, :@paricipate_projects => @paricipate_projects })

		kit = PDFKit.new(html)

		attachments['status.pdf'] = kit.to_pdf

  	mail to: user.email, subject: 'Projects status'
  end
end
