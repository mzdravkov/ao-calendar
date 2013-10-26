class RenameTaskIdToEventIdInTasks < ActiveRecord::Migration
  def change
    rename_column :tasks, :task_id, :event_id
  end
end
