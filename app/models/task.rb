class Task < ActiveRecord::Base
	belongs_to :executer, class_name: 'User'
	belongs_to :project

	validates_inclusion_of :persentage, :in => 0..100

  attr_accessible :name, :persentage, :project_id, :executer_id, :status, :executer


  STATUS = {:New => 0, :Assigned => 1, :'In progress'=> 2, :Finished => 3, :Closed => 4}

  def status
    STATUS.key(read_attribute(:status))
  end
 
  def status=(s)
    write_attribute(:status, STATUS[s.to_sym])
  end

  def closed?
    self.status == :Closed
  end

  def close
    self.status = :Closed
    self.persentage = 100
  end

  def to_s
  	name
  end
end
