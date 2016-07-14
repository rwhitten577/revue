FactoryGirl.define do
  factory :user do
    sequence(:username) { |n| "jolene#{n}" }
    sequence(:email) { |n| "dparton#{n}@gmail.com" }
    password 'password'
    admin false
  end

  factory :venue do
    sequence (:name) { |n| "Venue #{n}" }
    sequence (:street) { |n| "Street #{n}" }
    city 'Boston'
    state 'MA'
    website 'http://www.venue.com'
    category 'Music'
    description 'The greatest venue of all time'
    avg_rating '8'
    photo './images/studio_engineer.jpeg'
  end

  factory :review do
    association :venue
    rating 9
    description 'Great venue!'
    sum_votes 0
  end

  factory :vote do
    association :user
    association :review
    value 1
  end
end
