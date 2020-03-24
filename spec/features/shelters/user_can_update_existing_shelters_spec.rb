require 'rails_helper'

RSpec.describe "shelters show page", type: :feature do
  it "can show shelters with edited details" do
    shelter_1 = Shelter.create(name: "Adams County Animal Shelter",
                               address: "10705 Folton St",
                               city: "Henderson",
                               state: "CO",
                               zip: "80640")

    visit "/shelters/#{shelter_1.id}/edit"

    fill_in 'Name', with: 'Adams County Animal Services'
    fill_in 'Address', with: '10705 Fulton St'
    fill_in 'City', with: 'Brighton'
    fill_in 'State', with: 'CO'
    fill_in 'Zip', with: '80601'
    click_button 'Update'

    expect(page).to have_content('Adams County Animal Services')
    expect(page).to_not have_content('Adams County Animal Shelter')
    expect(current_path).to eq("/shelters/#{shelter_1.id}")
  end
end
