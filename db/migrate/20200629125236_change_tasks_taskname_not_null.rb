class ChangeTasksTasknameNotNull < ActiveRecord::Migration[5.2]
  def change
    change_column_null :tasks, :task_name, false, 0
  end
end
