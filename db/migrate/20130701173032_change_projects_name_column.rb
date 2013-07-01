class ChangeProjectsNameColumn < ActiveRecord::Migration
  def up
  	change_column :projects, :name, :string, unique: true, null: false
  end

  def down
  	change_column :projects, :name, :string
  end
end
