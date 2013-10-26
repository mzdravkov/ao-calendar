class AddJoinTableForManyToManyBetweenUsersAndGroupCalendars < ActiveRecord::Migration
  def change
    create_table :users_group_calendars do |t|
      t.belongs_to :user
      t.belongs_to :group_calendar
    end
  end
end
