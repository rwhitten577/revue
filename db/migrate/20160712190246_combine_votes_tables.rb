class CombineVotesTables < ActiveRecord::Migration
  def change
    drop_table :downvotes
    rename_table :upvotes, :votes
  end
end
