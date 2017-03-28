require 'modules/roles'

class User < ActiveRecord::Base
  include Modules::Roles
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :projects, foreign_key: :owner_id

  def executing_tasks(project = nil)
    tasks = Task.where('executer_id = :user', user: self)
    tasks = tasks.where('project_id = :project',project: project) if project

    tasks
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

  # does user owns the project or execute task
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
