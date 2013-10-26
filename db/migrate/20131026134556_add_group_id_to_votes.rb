class AddGroupIdToVotes < ActiveRecord::Migration
  def change
    add_column :votes, :group_id, :integer
  end
end
