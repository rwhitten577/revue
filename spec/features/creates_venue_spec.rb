require "rails_helper"

# As an authenticated user
# I want to add an item
# So that others can review it

# Acceptance Criteria:

# [ ] There should be a link from the venue index page that takes you to the new venue page. On this page there is a form to create a new venue.
# [ ] I must be signed in, and I must supply a name, street, city, state, website.
# [ ] If the form submission is successful, I should be brought to the venue's show page, and I should see a message that lets me know that I have created a venue successfully.
# [ ] If the form submission is unsuccessful, I should remain on the venue new page, and I should see error messages explaining why the form submission was unsuccessful. The form should be pre-filled with the values that were provided when the form was submitted.

feature "user creates venue" do
  let(:venue) { FactoryGirl.attributes_for(:venue) }

  scenario "user visits new venue form" do
    visit venues_path
    click_link("Add New Venue")

    expect(current_path).to eq(new_venue_path)
    expect(page).to have_selector("form")
    expect(page).to have_content("Venue Name")
    expect(page).to have_content("Street")
    expect(page).to have_content("City")
    expect(page).to have_content("State")
    expect(page).to have_content("Venue Website")
    expect(page).to have_content("Venue Category")
    expect(page).to have_content("Description")
  end

  scenario "user inputs valid name, location, and category" do
    visit venues_path
    click_link("Add New Venue")
    fill_in("Venue Name", with: venue[:name])
    fill_in("Street", with: venue[:street])
    fill_in("City", with: venue[:city])
    select("Massachusetts", from: "State")
    fill_in("Venue Website", with: venue[:website])
    choose("venue_category_music")
    fill_in("venue_description", with: venue[:description])
    click_button("Add Venue")

    expect(current_path).to eq("/venues/#{Venue.first.id}")
    expect(page).to have_content("Venue successfully added!")
    expect(page).to have_content(venue[:name])
  end

  scenario "user does not input name" do
    visit venues_path
    click_link("Add New Venue")
    fill_in("Street", with: venue[:street])
    fill_in("City", with: venue[:city])
    select("Massachusetts", from: "State")
    fill_in("Venue Website", with: venue[:website])
    choose("venue_category_music")
    fill_in("venue_description", with: venue[:description])
    click_button("Add Venue")


    expect(page).to have_content("Name can't be blank")
    expect(page).not_to have_content("Venue successfully added!")
    expect(page).not_to have_content("Street can't be blank")
    expect(page).not_to have_content("City can't be blank")
    expect(page).not_to have_content("State can't be blank")
    expect(page).not_to have_content("Category can't be blank")
    expect(page).to have_content("There were problems saving your venue")
    expect(find("#venue_street").value).to eq(venue[:street])
    expect(find("#venue_city").value).to eq(venue[:city])
    expect(find("#venue_website").value).to eq(venue[:website])
    expect(find("#venue_category_music").value).to eq(venue[:category])
    expect(find("#venue_description").value).to eq(venue[:description])
  end

  scenario "user does not input street" do
    visit venues_path
    click_link("Add New Venue")

    fill_in("Name", with: venue[:name])
    fill_in("City", with: venue[:city])
    select("Massachusetts", from: "State")
    fill_in("Venue Website", with: venue[:website])
    choose("venue_category_music")
    fill_in("venue_description", with: venue[:description])
    click_button("Add Venue")

    expect(page).to have_content("Street can't be blank")
    expect(page).not_to have_content("Venue successfully added!")
    expect(page).not_to have_content("Name can't be blank")
    expect(page).not_to have_content("City can't be blank")
    expect(page).not_to have_content("State can't be blank")
    expect(page).not_to have_content("Category can't be blank")
    expect(page).to have_content("There were problems saving your venue")
    expect(find("#venue_name").value).to eq(venue[:name])
    expect(find("#venue_city").value).to eq(venue[:city])
    expect(find("#venue_website").value).to eq(venue[:website])
    expect(find("#venue_category_music").value).to eq(venue[:category])
    expect(find("#venue_description").value).to eq(venue[:description])
  end

  scenario "user does not input city" do
    visit venues_path
    click_link("Add New Venue")

    fill_in("Name", with: venue[:name])
    fill_in("Street", with: venue[:street])
    select("Massachusetts", from: "State")
    fill_in("Venue Website", with: venue[:website])
    choose("venue_category_music")
    fill_in("venue_description", with: venue[:description])
    click_button("Add Venue")

    expect(page).to have_content("City can't be blank")
    expect(page).not_to have_content("Venue successfully added!")
    expect(page).not_to have_content("Name can't be blank")
    expect(page).not_to have_content("Street can't be blank")
    expect(page).not_to have_content("State can't be blank")
    expect(page).not_to have_content("Category can't be blank")
    expect(page).to have_content("There were problems saving your venue")
    expect(find("#venue_name").value).to eq(venue[:name])
    expect(find("#venue_street").value).to eq(venue[:street])
    expect(find("#venue_website").value).to eq(venue[:website])
    expect(find("#venue_category_music").value).to eq(venue[:category])
    expect(find("#venue_description").value).to eq(venue[:description])
  end

  scenario "user does not select state" do
    visit venues_path
    click_link("Add New Venue")

    fill_in("Name", with: venue[:name])
    fill_in("Street", with: venue[:street])
    fill_in("City", with: venue[:city])
    fill_in("Venue Website", with: venue[:website])
    choose("venue_category_music")
    fill_in("venue_description", with: venue[:description])
    click_button("Add Venue")

    expect(page).to have_content("State can't be blank")
    expect(page).not_to have_content("Venue successfully added!")
    expect(page).not_to have_content("Name can't be blank")
    expect(page).not_to have_content("Street can't be blank")
    expect(page).not_to have_content("City can't be blank")
    expect(page).not_to have_content("Category can't be blank")
    expect(page).to have_content("There were problems saving your venue")
    expect(find("#venue_name").value).to eq(venue[:name])
    expect(find("#venue_street").value).to eq(venue[:street])
    expect(find("#venue_city").value).to eq(venue[:city])
    expect(find("#venue_website").value).to eq(venue[:website])
    expect(find("#venue_category_music").value).to eq(venue[:category])
    expect(find("#venue_description").value).to eq(venue[:description])
  end

  scenario "user does not select a category" do
    visit venues_path
    click_link("Add New Venue")

    fill_in("Name", with: venue[:name])
    fill_in("Street", with: venue[:street])
    fill_in("City", with: venue[:city])
    select("Massachusetts", from: "State")
    fill_in("Venue Website", with: venue[:website])
    fill_in("venue_description", with: venue[:description])
    click_button("Add Venue")

    expect(page).to have_content("Category can't be blank")
    expect(page).not_to have_content("Venue successfully added!")
    expect(page).not_to have_content("Name can't be blank")
    expect(page).not_to have_content("Street can't be blank")
    expect(page).not_to have_content("City can't be blank")
    expect(page).to have_content("There were problems saving your venue")
    expect(find("#venue_name").value).to eq(venue[:name])
    expect(find("#venue_street").value).to eq(venue[:street])
    expect(find("#venue_city").value).to eq(venue[:city])
    expect(find("#venue_website").value).to eq(venue[:website])
    expect(find("#venue_description").value).to eq(venue[:description])
  end

  scenario "user submits a blank form" do
    visit venues_path
    click_link("Add New Venue")
    click_button("Add Venue")

    expect(page).not_to have_content("Venue successfully added!")
    expect(page).to have_content("Name can't be blank")
    expect(page).to have_content("Street can't be blank")
    expect(page).to have_content("City can't be blank")
    expect(page).to have_content("State can't be blank")
    expect(page).to have_content("Category can't be blank")
    expect(page).to have_content("There were problems saving your venue")
  end
end
