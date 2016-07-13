require 'rails_helper'

feature 'user sees reviews' do
  scenario 'sees all the reviews for a venue on the venue page' do
    venue = FactoryGirl.create(:venue)
    user = FactoryGirl.create(:user)
    review = FactoryGirl.create(:review, user: user, venue: venue)

    visit venue_path(venue)

    expect(page).to have_content(review.description)
    expect(find('.review:first-of-type').text).to include(review.description)
  end
end
