require 'rails_helper'

feature 'user deletes venue' do
  let!(:venue) { FactoryGirl.create(:venue) }
  let!(:another_venue)  { FactoryGirl.create(:venue) }

  scenario 'user deletes venue from show page' do
    visit venue_path(venue)
    click_link('Delete Venue')

    expect(Venue.all.count).to eq(1)

    expect(current_path).to eq(venues_path)
    expect(page).not_to have_content(venue.name)
    expect(page).to have_content(another_venue.name)
  end
end
