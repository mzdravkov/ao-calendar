class CreateIgnoredEventsUsersTable < ActiveRecord::Migration
  def change
    create_table :ignored_events_users do |t|
      t.integer :event_id
      t.integer :user_id
    end
  end
end
