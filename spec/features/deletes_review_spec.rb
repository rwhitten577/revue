require 'rails_helper'

feature 'user deletes venue' do
  let!(:venue) { FactoryGirl.create(:venue) }
  let!(:user) { FactoryGirl.create(:user) }
  let!(:review) { FactoryGirl.attributes_for(:review, user: user) }

  context 'user is signed in' do
    before do
      sign_in
    end

    scenario 'deletes review from show page' do
      visit venue_path(venue)
      click_link 'Add New Review'
      select 10, from: 'review_rating'
      fill_in 'review_description', with: 'This place is awesome!!!!'
      click_on 'Submit Review'
      click_link('Delete Review')

      expect(Review.all.count).to eq(0)

      expect(current_path).to eq(venue_path(venue))
      expect(page).not_to have_content('This place is awesome!!!!')
    end
  end

  context 'user is not signed in' do
    scenario 'cannot delete review from show page' do
      visit venue_path(venue)

      expect(page).not_to have_link('Delete Review')
    end
  end
end
