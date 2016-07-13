require 'rails_helper'

feature 'user edits account information' do
  let(:user) { FactoryGirl.create(:user) }
  let(:another_user) { FactoryGirl.attributes_for(:user) }
  let!(:venue) { FactoryGirl.create(:venue) }

  before do
    visit venues_path
    click_link 'Sign In'
    fill_in 'Login', with: user[:email]
    fill_in 'Password', with: 'password'
    click_button 'Log in'
    click_link 'Edit Account'
  end

  scenario 'user sees edit form' do
    expect(current_path).to eq(edit_user_registration_path)

    expect(page).to have_selector('form')

    expect(page).to have_content('Username')
    expect(page).to have_content('Email')
    expect(page).to have_content('Password')
    expect(page).to have_content('Password confirmation')
    expect(page).to have_content('Avatar')
    expect(page).to have_button('Update')
  end

  scenario 'user inputs valid fields' do
    fill_in 'Username', with: another_user[:username]
    fill_in 'Email', with: another_user[:email]
    fill_in 'Current password', with: 'password'
    fill_in 'Password', with: another_user[:password]
    fill_in 'Password confirmation', with: another_user[:password]
    click_button 'Update'

    expect(page).to have_content('Your account has been updated successfully')
  end

  scenario 'user leaves out required fields' do
    fill_in 'Username', with: ''
    fill_in 'Email', with: ''
    fill_in 'Password', with: ''
    fill_in 'Password confirmation', with: ''
    click_button 'Update'

    expect(page).to have_content('prohibited this user from being saved')
  end

  scenario 'user uploads new profile photo' do
    fill_in 'Current password', with: 'password'
    attach_file'Avatar', 'spec/support/images/studio_engineer.jpeg'
    click_button 'Update'

    expect(page).to have_css("img[src*='studio_engineer.jpeg']")
  end
end
