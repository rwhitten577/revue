FactoryGirl.define do
  factory :user do
    sequence(:first_name) { |n| "Dolly#{n}"}
    sequence(:last_name) { |n| "Parton#{n}"}
    sequence(:username) { |n| "jolene#{n}"}
    sequence(:email) { |n| "dparton#{n}@gmail.com"}
    sequence(:password) { |n| "password#{n}"}
    avatar_url "https://avatars2.githubusercontent.com/u/174825?v=3&s=400"
    admin true
  end

  factory :venue do
    sequence (:name) { |n| "Venue #{n}" }
    sequence (:street) { |n| "Street #{n}" }
    city "Boston"
    state "MA"
    website "http://www.venue.com"
    category "Music"
    description "The greatest venue of all time"
    avg_rating "8"
  end

  factory :review do
    association :venue
    rating 10
    description "Great venue!"
    upvotes 5
    downvotes 3
  end

  factory :comment do
    association :user
    association :review
    sequence (:body) { |n| "Amazing comment #{n}" }
  end
end
