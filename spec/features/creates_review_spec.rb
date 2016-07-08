require "rails_helper"

feature "user creates review" do
  let(:venue) { FactoryGirl.create(:venue) }
  let(:review) { FactoryGirl.attributes_for(:review) }

  scenario "user visits new review form" do
    visit venue_path(venue)
    click_link "Add New Review"

    expect(page).to have_selector("form")

    expect(page).to have_content("Rating")
    expect(page).to have_content("Description")
    expect(page).to have_content(venue.name)
  end

  scenario "user inputs valid rating" do
    visit venue_path(venue)
    click_link "Add New Review"
    select 10, from: "review_rating"
    click_on "Submit Review"

    expect(page).to have_content("Review successfully added!")
    expect(current_path).to eq("/venues/#{Venue.first.id}")
    expect(page).to have_content(:review)
  end
end
