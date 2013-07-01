class UserMailer < ActionMailer::Base
  default from: "from@example.com"

  def status(user)
  	@name = user.name
  	@projects = Project.where('owner_id = :user', user: user).includes(:tasks)
  	mail to: user.email, subject: 'Projects status'
  end
end
