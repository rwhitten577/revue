require 'rails_helper'

feature "user sees reviews" do
  scenario "sees all the reviews for a venue on the venue page" do
    venue =  FactoryGirl.create(:venue)
    review = FactoryGirl.create(:review)

    visit venue_path(venue)
    click_link "Add New Review"
    select review.rating, from: "review_rating"
    fill_in "review_description", with: review[:description]
    click_on "Submit Review"

    expect(page).to have_content(review.description)
  end
end
