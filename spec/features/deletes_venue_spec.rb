require 'rails_helper'

feature 'user deletes venue' do
  let!(:another_venue)  { FactoryGirl.create(:venue) }
  let!(:user) { FactoryGirl.create(:user) }
  let!(:venue) { FactoryGirl.create(:venue, user: user) }
  let!(:admin) { FactoryGirl.create(:user, admin: true) }
  let(:venue_2) { FactoryGirl.create(:venue, user: admin) }

  scenario 'authenticated user deletes venue from show page if their venue', js: true do
    visit venues_path
    click_link 'Sign In'
    fill_in 'Login', with: user[:email]
    fill_in 'Password', with: 'password'
    click_button 'Log in'

    visit venue_path(venue)
    click_link('Delete Venue')

    expect(current_path).to eq(venues_path)
    expect(page).not_to have_content(venue.name)
    expect(page).to have_content(another_venue.name)

    expect(Venue.all.count).to eq(1)
  end

  scenario 'inauthenticated user cannot delete venue' do
    visit venue_path(venue)

    expect(page).not_to have_link('Delete Venue')
  end

  scenario 'authenticated user cannot delete venue not their own' do
    visit venues_path
    click_link 'Sign In'
    fill_in 'Login', with: user[:email]
    fill_in 'Password', with: 'password'
    click_button 'Log in'

    visit venue_path(venue_2)

    expect(page).not_to have_link('Delete Venue')
  end

  scenario 'admin can delete any venue' do
    visit venues_path
    click_link 'Sign In'
    fill_in 'Login', with: admin[:email]
    fill_in 'Password', with: 'password'
    click_button 'Log in'

    visit venue_path(venue)
    expect(page).to have_link('Delete Venue')
  end
end
