class ChangeStatusColumnType < ActiveRecord::Migration
  def up
    change_column :tasks, :status, :string
  end

  def down
    change_column :tasks, :status, :integer
  end
end
