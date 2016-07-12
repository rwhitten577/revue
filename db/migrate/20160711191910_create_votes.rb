class CreateVotes < ActiveRecord::Migration
  def change
    create_table :upvotes do |t|
      t.belongs_to :review, null: false
      t.belongs_to :user, null: false
    end

    create_table :downvotes do |t|
      t.belongs_to :review, null: false
      t.belongs_to :user, null: false
    end
  end
end
