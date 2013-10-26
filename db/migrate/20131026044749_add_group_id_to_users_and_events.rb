class AddGroupIdToUsersAndEvents < ActiveRecord::Migration
  def change
    add_column :users, :group_id, :integer
    add_column :events, :group_id, :integer
  end
end
