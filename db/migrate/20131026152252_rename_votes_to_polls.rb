class RenameVotesToPolls < ActiveRecord::Migration
  def change
    rename_table :votes, :polls
  end
end
