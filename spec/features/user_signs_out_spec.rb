require 'rails_helper'

feature 'user creates account' do
  let(:user) { FactoryGirl.create(:user) }
  let!(:venue) { FactoryGirl.create(:venue) }

  scenario 'user signs out' do
    visit venues_path
    click_link 'Sign In'
    fill_in 'Login', with: user[:email]
    fill_in 'Password', with: 'password'
    click_button 'Log in'

    click_link 'Sign Out'

    expect(page).to have_content('Signed out successfully')
    expect(page).to have_link('Sign In')

    expect(page).not_to have_link('Sign Out')
  end
end
