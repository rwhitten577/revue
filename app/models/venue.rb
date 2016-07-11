class Venue < ActiveRecord::Base

  CATEGORIES = [
    ["Music", "Music"],
    ["Comedy", "Comedy"],
    ["Poetry", "Poetry"],
    ["Theater", "Theater"]
  ]

  validates :name, presence: true
  validates :street, presence: true
  validates :city, presence: true
  validates :state, presence: true
  validates :category, presence: true, inclusion: { in: %w(Music Comedy Poetry Theater) }

  has_many :reviews
  belongs_to :user

  def self.search(query)
    where('name ILIKE ?', "%#{query}%")
  end
end
