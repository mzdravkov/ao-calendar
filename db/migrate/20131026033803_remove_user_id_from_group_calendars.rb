class RemoveUserIdFromGroupCalendars < ActiveRecord::Migration
  def change
    remove_column :group_calendars, :user_id
  end
end
