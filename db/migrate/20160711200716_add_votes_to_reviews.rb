class AddVotesToReviews < ActiveRecord::Migration
  def change
    add_column :reviews, :sum_votes, :integer, default: 0, null: false
  end
end
