class Task < ActiveRecord::Base
	belongs_to :executer, class_name: 'User'
	belongs_to :project

	validates_inclusion_of :persentage, :in => 0..100

  symbolize :status , :in =>[:new, :assigned, :finished, :closed], default: :new, methods: true

  def close
    self.status = :closed
    self.persentage = 100
  end

  def to_s
  	name
  end
end
