FactoryGirl.define do
  factory :user do
    sequence(:username) { |n| "jolene#{n}" }
    sequence(:email) { |n| "dparton#{n}@gmail.com" }
    password 'password'
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
  end

  factory :review do
    association :venue
    association :user
    rating 10
    description 'Great venue!'
    upvotes 5
    downvotes 3
  end

  factory :comment do
    association :user
    association :review
    sequence (:body) { |n| "Amazing comment #{n}" }
  end
end
