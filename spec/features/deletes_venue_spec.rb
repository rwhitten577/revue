require 'rails_helper'

feature 'user deletes venue' do
  let!(:another_venue)  { FactoryGirl.create(:venue) }
  let!(:user) { FactoryGirl.create(:user) }
  let!(:venue) { FactoryGirl.create(:venue, user: user) }

  scenario 'authenticated user deletes venue from show page' do
    visit venues_path
    click_link 'Sign In'
    fill_in 'Login', with: user[:email]
    fill_in 'Password', with: 'password'
    click_button 'Log in'

    visit venue_path(venue)
    click_link('Delete Venue')

    expect(Venue.all.count).to eq(1)

    expect(current_path).to eq(venues_path)
    expect(page).not_to have_content(venue.name)
    expect(page).to have_content(another_venue.name)
  end

  scenario 'inauthenticated user cannot delete venue' do
    visit venue_path(venue)

    expect(page).not_to have_link('Delete Venue')
  end
end
