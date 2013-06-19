class Task < ActiveRecord::Base
	belongs_to :executer, class_name: 'User'
	belongs_to :project

  attr_accessible :name, :persentage, :project, :status, :executer
end
