require 'rails_helper'

# As an authenticated user
# I want to view a list of items
# So that I can pick items to review
#
# Acceptance Criteria
#
# - I must see the name of each venue
# - I must see venues listed in alphabetical order


feature "user sees venues" do
  scenario "see all the venues" do
    venue = FactoryGirl.create(:venue, name: 'ZZZZ')
    another_venue = FactoryGirl.create(:venue, name: 'AAAA')
    FactoryGirl.create(:venue, name: 'DDDD')

    visit venues_path

    expect(page).to have_content('Venues')
    expect(page).to have_content(venue.name)
    expect(page).to have_selector(".venue", count: 3)

    expect(page).to have_link(venue.name)

    expect(page).to have_content(venue.name)
    expect(page).to have_content(another_venue.name)
    expect(find(".venue:first-of-type").text).to include(another_venue.name)
  end

  scenario "user sees no venues" do
    visit venues_path

    expect(page).to have_content("There are no venues")
    expect(page).not_to have_selector('.venue')
  end
end
