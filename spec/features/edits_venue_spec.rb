require 'rails_helper'

feature 'user edits venue' do
  let!(:user) { FactoryGirl.create(:user) }
  let!(:another_user) { FactoryGirl.create(:user, admin: true) }
  let(:venue) { FactoryGirl.create(:venue, user: user) }
  let(:new_venue) { FactoryGirl.build(:venue) }
  let(:venue_2) { FactoryGirl.create(:venue, user: another_user) }


  context 'inauthenticated user' do
    scenario 'cannot edit venue' do
      visit venue_path(venue)

      expect(page).not_to have_link('Edit Venue')
    end
  end

  context 'current user created venue' do
    before do
      visit venues_path
      click_link 'Sign In'
      fill_in 'Login', with: user[:email]
      fill_in 'Password', with: 'password'
      click_button 'Log in'
    end

    scenario 'visits edit venue form' do
      visit venue_path(venue)
      click_link 'Edit Venue'

      expect(current_path).to eq(edit_venue_path(venue))

      expect(page).to have_selector('form')

      expect(page).to have_content('Venue Name')
      expect(page).to have_content('Street')
      expect(page).to have_content('City')
      expect(page).to have_content('State')
      expect(page).to have_content('Venue Website')
      expect(page).to have_content('Venue Category')
      expect(page).to have_content('Description')

      expect(find('#venue_name').value).to eq(venue[:name])
      expect(find('#venue_street').value).to eq(venue[:street])
      expect(find('#venue_city').value).to eq(venue[:city])
      expect(find('#venue_website').value).to eq(venue[:website])
      expect(find('#venue_category_music').value).to eq(venue[:category])
      expect(find('#venue_description').value).to eq(venue[:description])
    end

    scenario 'inputs valid name, location, and category' do
      visit venue_path(venue)
      click_link 'Edit Venue'

      fill_in 'Venue Name', with: new_venue[:name]
      fill_in 'Street', with: new_venue[:street]
      fill_in 'City', with: new_venue[:city]
      select 'Massachusetts', from: 'State'
      fill_in 'Venue Website', with: new_venue[:website]
      choose 'venue_category_comedy'
      fill_in 'venue_description', with: new_venue[:description]
      click_button 'Save Changes'

      expect(current_path).to eq(venue_path(venue))

      expect(page).to have_content('Venue successfully saved!')
      expect(page).to have_content(new_venue[:name])
      expect(page).to have_content('Comedy')

      expect(page).not_to have_content(venue[:name])
    end

    scenario 'does not complete required fields' do
      visit venue_path(venue)
      click_link 'Edit Venue'

      fill_in 'Name', with: ''
      fill_in 'Street', with: ''
      fill_in 'City', with: new_venue[:city]
      select 'Massachusetts', from: 'State'
      fill_in 'Venue Website', with: new_venue[:website]
      choose 'venue_category_poetry'
      fill_in 'venue_description', with: new_venue[:description]
      click_button 'Save Changes'

      expect(page).to have_content("Name can't be blank")
      expect(page).to have_content("Street can't be blank")

      expect(page).not_to have_content('Venue successfully saved!')

      expect(page).to have_content('There were problems saving your venue')

      expect(find('#venue_city').value).to eq(new_venue[:city])
      expect(find('#venue_website').value).to eq(new_venue[:website])
      expect(find('#venue_description').value).to eq(new_venue[:description])
    end

    scenario 'submits a blank form' do
      visit venue_path(venue)
      click_link 'Edit Venue'

      fill_in 'Name', with: ''
      fill_in 'Street', with: ''
      fill_in 'City', with: ''
      select 'Select a State', from: 'State'
      click_button 'Save Changes'

      expect(page).not_to have_content('Venue successfully added!')

      expect(page).to have_content("Name can't be blank")
      expect(page).to have_content("Street can't be blank")
      expect(page).to have_content("City can't be blank")
      expect(page).to have_content("State can't be blank")
      expect(page).to have_content('There were problems saving your venue')
    end

    scenario 'current user did not create venue' do
      visit venue_path(venue_2)

      expect(page).not_to have_link('Edit Venue')
    end
  end

  context 'user is admin' do
    before do
      visit venues_path
      click_link 'Sign In'
      fill_in 'Login', with: another_user[:email]
      fill_in 'Password', with: 'password'
      click_button 'Log in'
    end

    scenario 'can edit a venue' do
      visit venue_path(venue)

      expect(page).to have_link('Edit Venue')
    end
  end
end
