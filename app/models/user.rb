class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :projects, foreign_key: :owner_id


  attr_accessible :name, :roles, :blocked, :email, :password, :password_confirmation, :remember_me

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

  def self.send_status_mail
    select('id, name, email').each do |user|
      user.send_status_mail
    end
  end

  # user owns the project or execute task
  def need_send_status_mail?
    Project.owned_by(self).count > 0 ||
    Project.executed_by(self).count.present?
  end

  def send_status_mail    
    UserMailer.status(self).deliver if need_send_status_mail?
  end



  def to_s
    name
  end
end
