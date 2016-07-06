class CreateVenues < ActiveRecord::Migration
  def change
    create_table :venues do |t|
      t.string :name, null: false
      t.string :street, null: false
      t.string :city, null: false
      t.string :state, null: false, length: 2
      t.string :website
      t.string :category, null: false
      t.string :description
      t.integer :avg_rating

      t.timestamps null: false 
    end
  end
end
