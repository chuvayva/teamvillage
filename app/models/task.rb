class Task < ActiveRecord::Base
	belongs_to :executer, class_name: 'User'
	belongs_to :project

	validates_inclusion_of :persentage, :in => 0..100

  attr_accessible :name, :persentage, :project_id, :executer_id, :status, :executer

  def to_s
  	name
  end
end
