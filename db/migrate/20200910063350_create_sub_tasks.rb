class CreateSubTasks < ActiveRecord::Migration[5.2]
  def change
    create_table :sub_tasks do |t|
      t.string :content, default: "False"
      t.references :task, foreign_key: true

      t.timestamps
    end
  end
end
