class AddAttributesToTaskColumn < ActiveRecord::Migration
  def up
  	change_column :tasks, :persentage, :integer, :null => false, :default => 0
  end
	
	def down
  	change_column :tasks, :persentage, :integer
  end
end
