require 'rails_helper'

feature 'user edits review' do
  let!(:venue) { FactoryGirl.create(:venue) }
  let!(:user) { FactoryGirl.create(:user) }
  let!(:review) { FactoryGirl.attributes_for(:review, user: user) }

  context 'user is signed in' do
    before do
      sign_in
    end

    scenario 'user visits edit review form' do
      visit venue_path(venue)
      click_link 'Add New Review'
      select 10, from: 'review_rating'
      click_on 'Submit Review'

      visit venue_path(venue)
      click_link 'Edit Review'

      expect(page).to have_selector('form')

      expect(page).to have_content('Rating')
      expect(page).to have_content('Description')
      expect(page).to have_content(venue.name)
    end

    scenario 'user inputs valid form' do
      visit venue_path(venue)
      click_link 'Add New Review'
      select 10, from: 'review_rating'
      click_on 'Submit Review'

      visit venue_path(venue)
      click_link 'Edit Review'
      select 9, from: 'review_rating'
      click_on 'Submit Review'

      expect(page).to have_content('Review successfully edited!')
      expect(page).to have_content('9')
      expect(page).to_not have_content('10')
      expect(current_path).to eq("/venues/#{Venue.first.id}")
      expect(page).to have_content(:review)
    end
  end

  context 'user is not signed in' do
    scenario 'cannot edit review from show page' do
      visit venue_path(venue)

      expect(page).not_to have_link('Edit Review')
    end
  end
end
