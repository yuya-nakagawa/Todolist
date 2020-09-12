class ChangeContentOfSubTasks < ActiveRecord::Migration[5.2]
  def up
    change_column :sub_tasks, :content, :string, default: nil
  end

  def down
    change_column :sub_tasks, :content, :string, default: "False"
  end
end
