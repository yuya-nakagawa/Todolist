class ChangeDoneOfTasks < ActiveRecord::Migration[5.2]
  def up
    change_column :tasks, :done, :string, default: "False"
  end

  def down
    change_column :tasks, :done, :string
  end

end
