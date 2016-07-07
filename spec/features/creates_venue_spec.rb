require 'rails_helper'

feature 'user creates venue' do
  let(:venue) { FactoryGirl.attributes_for(:venue) }
  let(:user) { FactoryGirl.create(:user) }

  before do |example|
    unless example.metadata[:skip_before]
      visit venues_path
      click_link 'Sign In'
      fill_in 'Login', with: user[:email]
      fill_in 'Password', with: 'password'
      click_button 'Log in'
    end
  end

  scenario 'unauthorized user visits new venue form', :skip_before do
    visit venues_path

    click_link 'Add New Venue'

    expect(page).to have_content('You must be signed in to add a new venue')

    expect(page).not_to have_selector('form')
  end

  scenario 'authorized user visits new venue form' do
    click_link 'Add New Venue'

    expect(current_path).to eq(new_venue_path)

    expect(page).to have_selector('form')

    expect(page).to have_content('Venue Name')
    expect(page).to have_content('Street')
    expect(page).to have_content('City')
    expect(page).to have_content('State')
    expect(page).to have_content('Venue Website')
    expect(page).to have_content('Venue Category')
    expect(page).to have_content('Description')
  end

  scenario 'user inputs valid name, location, and category' do
    click_link 'Add New Venue'
    fill_in 'Venue Name', with: venue[:name]
    fill_in 'Street', with: venue[:street]
    fill_in 'City', with: venue[:city]
    select 'Massachusetts', from: 'State'
    fill_in 'Venue Website', with: venue[:website]
    choose 'venue_category_music'
    fill_in 'venue_description', with: venue[:description]
    click_button 'Add Venue'

    expect(current_path).to eq("/venues/#{Venue.first.id}")
    expect(page).to have_content('Venue successfully added!')
    expect(page).to have_content(venue[:name])
  end

  scenario 'user does not complete required fields' do
    click_link 'Add New Venue'
    fill_in 'Name', with: ''
    fill_in 'Street', with: ''
    fill_in 'City', with: venue[:city]
    select 'Massachusetts', from: 'State'
    fill_in 'Venue Website', with: venue[:website]
    choose 'venue_category_music'
    fill_in 'venue_description', with: venue[:description]
    click_button 'Add Venue'


    expect(page).to have_content("Name can't be blank")
    expect(page).to have_content("Street can't be blank")

    expect(page).not_to have_content('Venue successfully added!')

    expect(page).to have_content('There were problems saving your venue')

    expect(find('#venue_city').value).to eq(venue[:city])
    expect(find('#venue_website').value).to eq(venue[:website])
    expect(find('#venue_category_music').value).to eq(venue[:category])
    expect(find('#venue_description').value).to eq(venue[:description])
  end

  scenario 'user submits a blank form' do
    click_link 'Add New Venue'
    click_button 'Add Venue'

    expect(page).not_to have_content('Venue successfully added!')
    expect(page).to have_content("Name can't be blank")
    expect(page).to have_content("Street can't be blank")
    expect(page).to have_content("City can't be blank")
    expect(page).to have_content("State can't be blank")
    expect(page).to have_content("Category can't be blank")
    expect(page).to have_content('There were problems saving your venue')
  end
end
