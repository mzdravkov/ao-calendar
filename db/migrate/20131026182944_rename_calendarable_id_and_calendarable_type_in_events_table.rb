class RenameCalendarableIdAndCalendarableTypeInEventsTable < ActiveRecord::Migration
  def change
    rename_column :events, :calendarable_id, :eventable_id
    rename_column :events, :calendarable_type, :eventable_type
  end
end
