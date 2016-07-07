class Review < ActiveRecord::Base
  validates :venue_id, presence: true
  validates :user_id, presence: true
  validates :rating, presence: true, numericality: { only_integer: true }, inclusion: {in: 1..10, message: "Rating must be between 1 - 10"}
  validates :upvotes, presence: true, numericality: { only_integer: true }
  validates :downvotes, presence: true, numericality: { only_integer: true }

  belongs_to :venue
  belongs_to :user
end
