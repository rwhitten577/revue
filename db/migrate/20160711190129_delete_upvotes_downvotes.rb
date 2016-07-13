class DeleteUpvotesDownvotes < ActiveRecord::Migration
  def change
    change_table :reviews do |t|
      t.remove :upvotes, :downvotes
    end
  end
end
