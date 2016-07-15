require 'rails_helper'

feature 'user creates review' do
  let!(:user) { FactoryGirl.create(:user) }
  let!(:venue) { FactoryGirl.create(:venue, user: user) }

  context 'user is signed in' do
    before do
      sign_in(user)
    end

    scenario 'visits new review form' do
      visit venue_path(venue)
      click_link 'Add New Review'

      expect(page).to have_selector('form')

      expect(page).to have_content('Rating')
      expect(page).to have_content('Description')
      expect(page).to have_content(venue.name)
    end

    scenario 'inputs valid rating' do
      ActionMailer::Base.deliveries.clear

      visit venue_path(venue)
      click_link 'Add New Review'
      select 10, from: 'review_rating'
      click_on 'Submit Review'

      expect(page).to have_content('Review successfully added!')
      expect(current_path).to eq("/venues/#{Venue.first.id}")
      expect(page).to have_content(:review)
    end
  end

  context 'user is not signed in' do
    scenario 'visits new review form' do
      visit venue_path(venue)
      click_link 'Add New Review'

      expect(page).to have_content(venue.name)
      expect(page).to have_content('You must be signed in to add a new review')
      expect(page).not_to have_selector('rating')
    end
  end
end
