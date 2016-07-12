require 'rails_helper'

feature 'user upvotes' do
  let!(:venue) { FactoryGirl.create(:venue) }
  let!(:user) { FactoryGirl.create(:user) }
  let!(:review) { FactoryGirl.create(:review, user: user, venue: venue) }
  let!(:vote) { FactoryGirl.create(:vote, user: user, review: review) }
  let!(:another_review) { FactoryGirl.create(:review, user: user, venue: venue, description: "Review 2 description") }

  context 'user is signed in' do
    before do
      sign_in(user)
    end

    scenario 'user upvotes' do
      visit venue_path(venue)

      expect(page).to have_selector('.upvote')
      expect(page).to have_selector('.downvote')
      expect(page).to have_selector('.review')

      page.all('.upvote')[0].click
      
      expect(page).to have_content('2')
    end

    scenario 'user downvotes' do
      visit venue_path(venue)

      page.all('.downvote')[0].click
      expect(page).to have_content('-1')
    end
  end
end
