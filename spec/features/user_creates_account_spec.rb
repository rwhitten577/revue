require "rails_helper"

# As a prospective user
# I want to create an account
# So that I can post items and review them

feature "user creates account" do
  scenario "user creates account" do
    visit venues_path
    click_link "Sign Up"

    
  end
end
