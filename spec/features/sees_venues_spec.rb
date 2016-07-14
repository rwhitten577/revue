require 'rails_helper'

feature 'user sees venues' do
  scenario 'see all the venues', js: true do
    venue = FactoryGirl.create(:venue, name: 'ZZZZ')
    another_venue = FactoryGirl.create(:venue, name: 'AAAA')
    latest_venue = FactoryGirl.create(:venue, name: 'DDDD')

    visit venues_path

    expect(page).to have_content('VENUES')

    expect(page).to have_content(venue.name)
    expect(page).to have_selector('.venue', count: 3)

    expect(page).to have_link(venue.name)

    expect(page).to have_content(venue.name)
    expect(page).to have_content(another_venue.name)
    expect(page).to have_content(venue.photo)
    expect(find('.venue:first-of-type').text).to include(latest_venue.name)
  end

  scenario 'user sees no venues' do
    visit venues_path

    expect(page).not_to have_selector('.venue')
  end
end
