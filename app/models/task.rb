class Task < ActiveRecord::Base
	belongs_to :executer, class_name: 'User'
	belongs_to :project

  default_scope order('status desc')

	validates_inclusion_of :persentage, :in => 0..100

  attr_accessible :name, :persentage, :project_id, :executer_id, :status, :executer, :description

  symbolize :status , :in =>[:new, :assigned, :finished, :closed], default: :new, methods: true

  def close
    self.status = :closed
    self.persentage = 100
  end

  def to_s
  	name
  end
end
