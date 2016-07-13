require 'rails_helper'

feature 'admin' do
  let!(:admin) { FactoryGirl.create(:user, admin: true) }
  let!(:user) { FactoryGirl.create(:user) }

  scenario 'sees list of users' do
    sign_in(admin)

    visit admin_users_path

    expect(page).to have_content(user.username)
  end

  scenario 'admin deletes user' do
    sign_in(admin)

    visit admin_users_path
    click_link user.username

    click_link 'Delete User'

    expect(page).not_to have_content(user.username)
    expect(page).not_to have_content(user.email)
  end
end
