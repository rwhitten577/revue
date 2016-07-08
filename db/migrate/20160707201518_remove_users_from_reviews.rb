class RemoveUsersFromReviews < ActiveRecord::Migration
  def up
    remove_column :reviews, :user_id
  end

  def down
    add_column :reviews, :user_id, :integer, null: false
  end
end
