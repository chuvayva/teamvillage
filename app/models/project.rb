class Project < ActiveRecord::Base
	has_many :tasks
	belongs_to :owner, class_name: 'User'
	
  attr_accessible :name


  def to_s
  	name || email
  end
end
