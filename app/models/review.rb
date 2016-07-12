class Review < ActiveRecord::Base
  validates :venue_id, presence: true
  validates :user_id, presence: true
  validates :rating, presence: true, numericality: { only_integer: true }, inclusion: {in: 1..10, message: "Rating must be between 1 - 10"}
  validates :sum_votes, presence: true, numericality: { only_integer: true }

  belongs_to :venue
  belongs_to :user
  has_many :votes, dependent: :destroy

  def votes_total
    unless self.votes.nil?
      votes_arr = self.votes.map { |v| v.value  }
      total = votes_arr.inject(:+)
    end
  end
end
