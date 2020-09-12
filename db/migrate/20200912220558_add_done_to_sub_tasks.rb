class AddDoneToSubTasks < ActiveRecord::Migration[5.2]
  def change
    add_column :sub_tasks, :done, :string, default: "False"
  end
end
