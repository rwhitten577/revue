class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.belongs_to :venue, null: false
      t.belongs_to :user, null: false
      t.integer :rating, null: false
      t.text :description
      t.integer :upvotes, null: false, default: 0
      t.integer :downvotes, null: false, default: 0

      t.timestamps
    end
  end
end
