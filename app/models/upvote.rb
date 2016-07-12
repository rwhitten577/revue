class Upvote < ActiveRecord::Base
  validates :review_id, presence: true
  validates :user_id, presence: true

  belongs_to :review
  belongs_to :user
end
