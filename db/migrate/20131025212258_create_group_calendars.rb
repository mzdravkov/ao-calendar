class CreateGroupCalendars < ActiveRecord::Migration
  def change
    create_table :group_calendars do |t|
      t.string :name

      t.timestamps
    end
  end
end
