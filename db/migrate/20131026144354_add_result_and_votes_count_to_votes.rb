class AddResultAndVotesCountToVotes < ActiveRecord::Migration
  def change
    add_column :votes, :votes_count, :integer
    add_column :votes, :result, :integer
  end
end
