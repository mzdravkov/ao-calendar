class AddUserIdToCalendarsTables < ActiveRecord::Migration
  def change
    add_column :personal_calendars, :user_id, :integer
    add_column :group_calendars, :user_id, :integer
  end
end
