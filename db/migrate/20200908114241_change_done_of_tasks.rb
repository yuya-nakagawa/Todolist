class ChangeDoneOfTasks < ActiveRecord::Migration[5.2]
  def change
    def up
    change_column :tasks, :done, :string, default: 'false'
  end

  def down
    change_column :tasks, :done, :string
  end
  end
end
