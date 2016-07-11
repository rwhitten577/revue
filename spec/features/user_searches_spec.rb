require 'rails_helper'

feature 'search bar' do
  let!(:venue) { FactoryGirl.create(:venue, name: 'House of blues') }

  scenario 'appears on page' do
    visit venues_path
    expect(page).to have_button 'Search'
  end

  scenario 'returns results based on search criteria' do
    visit venues_path
    fill_in :search, with: 'House of blues'
    click_button 'Search'

    expect(page).to have_content(:venue['name'])
  end

  scenario 'returns nothing when no venues match' do
    visit venues_path
    fill_in :search, with: 'xschilvdivb'
    click_button 'Search'

    expect(page).not_to have_content('House of blues')
  end
end
