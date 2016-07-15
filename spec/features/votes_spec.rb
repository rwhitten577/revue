require 'rails_helper'

feature 'user upvotes' do
  let!(:user) { FactoryGirl.create(:user) }
  let!(:venue) { FactoryGirl.create(:venue, user: user) }
  let!(:review) { FactoryGirl.create(:review, user: user, venue: venue) }

  context 'authenticated user' do
    before do
      visit new_user_session_path

      page.fill_in 'Login', with: user[:email]
      page.fill_in 'Password', with: 'password'
      click_button 'Log in'
    end

    scenario 'upvotes', js: true do
      visit venue_path(venue)

      expect(page).to have_selector('.upvote')
      expect(page).to have_selector('.downvote')
      expect(page).to have_selector('.review')

      page.all('.upvote')[0].click

      expect(page).to have_content('1')
    end

    scenario 'downvotes', js: true do
      visit venue_path(venue)

      page.all('.downvote')[0].click
      
      expect(page).to have_content('-1')
    end

    scenario 'changes vote', js: true do
      visit venue_path(venue)

      page.all('.upvote')[0].click
      page.all('.downvote')[0].click
      expect(page).to have_content('-1')
    end

    scenario 'deletes vote', js: true do
      visit venue_path(venue)

      page.all('.upvote')[0].click
      page.all('.upvote')[0].click
      expect(page).to have_content('0')
    end
  end

  context 'inauthenticated user' do
    scenario 'cannot vote', js: true do
      visit venue_path(venue)

      page.all('.downvote')[0].click

      expect(page).to have_content('0')
    end
  end
end
