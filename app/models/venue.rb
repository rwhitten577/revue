class Venue < ActiveRecord::Base
  validates :name, presence: true
  validates :street, presence: true
  validates :city, presence: true
  validates :state, presence: true, length: { is: 2 }
  validates :category, presence: true, inclusion: { in: %w(Music Comedy Poetry Theater) }
end
