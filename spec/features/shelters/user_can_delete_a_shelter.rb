require 'rails_helper'

RSpec.describe "as a user", type: :feature do
  it "can delete a shelter from show page and be redirected to index page where shelter no longer exists" do
    shelter_1 = Shelter.create(name: "Adams County Animal Shelter",
                               address: "10705 Fulton St",
                               city: "Brighton",
                               state: "CO",
                               zip: "80601")
    shelter_2 = Shelter.create(name: "Humane Society of Boulder Valley",
                               address: "2323 55th St",
                               city: "Boulder",
                               state: "CO",
                               zip: "80301")

    visit "/shelters/#{shelter_1.id}"
    click_link 'Delete Shelter'

    expect(page).to have_content(shelter_2.name)
    expect(page).to_not have_content(shelter_1.name)
    expect(current_path).to eq("/shelters")
  end
end
