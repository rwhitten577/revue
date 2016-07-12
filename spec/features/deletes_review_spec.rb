require 'rails_helper'

feature 'user deletes venue' do
  let!(:venue) { FactoryGirl.create(:venue) }
  let!(:user) { FactoryGirl.create(:user) }
  let!(:admin) { FactoryGirl.create(:user, admin: true) }
  let!(:review) { FactoryGirl.create(:review, user: user, venue: venue) }
  let!(:user_2) { FactoryGirl.create(:user) }

  context 'user is signed in' do
    before do
      sign_in(user)
    end

    scenario 'deletes own review from show page' do
      visit venue_path(venue)
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

  context 'didnt create review or admin' do
    scenario 'didnt create review so cant delete' do
      sign_in(user_2)

      visit venue_path(venue)

      expect(page).not_to have_link('Delete Review')
    end

    scenario 'admin can delete anything' do
      sign_in(admin)

      visit venue_path(venue)
      expect(page).to have_link('Delete Review')
    end
  end
end
