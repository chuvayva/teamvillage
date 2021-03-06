class Project < ActiveRecord::Base
	has_many :tasks
	belongs_to :owner, class_name: 'User'

	scope :owned_by, ->(user) { where owner_id:user }
	scope :executed_by, ->(user) { joins(tasks: :executer).where('users.id = ?', user).group('projects.id') }

	validates :name, presence: true, uniqueness: true

  def progress
  	self.tasks.average(:persentage)
  end

  def to_s
  	name || email
  end
end
