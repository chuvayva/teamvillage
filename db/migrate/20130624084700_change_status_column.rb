class ChangeStatusColumn < ActiveRecord::Migration
  def up
  	change_column :tasks, :status, :integer
  end

  def down
  	change_column :tasks, :status, :string
  end
end
