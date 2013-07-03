class UserMailer < ActionMailer::Base
  default from: "from@example.com"

  STYLESHEETS_PATH = 'public/assets/application.css' 

  def status(user)
  	init_instance_vaiables_for user
  	
  	html = render_html_with instance_variables_hash

		attachments['status.pdf'] = pdf_from html
  	mail to: user.email, subject: 'Projects status'
  end

  private

  def init_instance_vaiables_for(user)
  	@name = user.name
  	@owned_projects = Project.owned_by(user).includes(:tasks)
  	@paricipate_projects = Project.executed_by(user).includes(:tasks) 
  	@paricipate_projects -= @owned_projects
  end

  def instance_variables_hash
  	names = instance_variables.delete_if do |name| 
  		name.to_s.start_with? '@_'
  	end

  	Hash[names.map{|v| [v, instance_eval(v.to_s)] }]
  end

  def render_html_with(locals)
  	render_to_string(template: 'user_mailer/status', layout: 'mail',locals: locals)
  end

  def pdf_from(html)
		kit = PDFKit.new(html)
		kit.stylesheets << STYLESHEETS_PATH if File.exist? STYLESHEETS_PATH

		kit.to_pdf
  end
end
