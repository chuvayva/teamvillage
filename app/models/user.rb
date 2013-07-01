class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :projects, foreign_key: :owner_id


  # Setup accessible (or protected) attributes for your model
  attr_accessible :name, :roles, :blocked, :email, :password, :password_confirmation, :remember_me
  # attr_accessible :title, :body

  ROLES = %w[admin]


  def executing_tasks(project = nil)
    tasks = Task.where('executer_id = :user', user: self)
    tasks = tasks.where('project_id = :project',project: project) if project

    tasks
  end

  def roles=(roles)
    self.roles_mask = (roles & ROLES).map { |r| 2**ROLES.index(r) }.sum
  end

	def roles
  	ROLES.reject { |r| ((self.roles_mask || 0) & 2**ROLES.index(r)).zero? }
	end

	def role?(role)
		roles.include? role.to_s
	end

  def owner_of?(project)
    project.try(:owner) == self
  end

  def executer_of?(task)
    task.try(:executer) == self
  end

  def send_status_mail    
    UserMailer.status(self).deliver
  end



  def to_s
    name
  end
end
