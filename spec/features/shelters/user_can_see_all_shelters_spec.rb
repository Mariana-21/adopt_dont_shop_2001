require 'rails_helper'

RSpec.describe "shelters index page", type: :feature do
  it "can see all shelter names" do
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

    visit "/shelters"

    expect(page).to have_content(shelter_1.name)
    expect(page).to have_content(shelter_2.name)
  end
end
