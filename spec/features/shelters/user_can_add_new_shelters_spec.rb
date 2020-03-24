require 'rails_helper'

RSpec.describe "shelters index page", type: :feature do
  it "can show shelters with added shelter" do

    visit "/shelters"

    click_link('New Shelter')

    expect(current_path).to eq('/shelters/new')

    expect(page).to have_field('Name')
    expect(page).to have_field('Address')
    expect(page).to have_field('City')
    expect(page).to have_field('State')
    expect(page).to have_field('Zip')

    fill_in 'Name', with: 'Stray Hearts Taos Animal Shelter'
    fill_in 'Address', with: '1200 Saint Frances Ln'
    fill_in 'City', with: 'Taos'
    fill_in 'State', with: 'NM'
    fill_in 'Zip', with: '87571'
    click_button('Create Shelter')
    #
    expect(current_path).to eq('/shelters')
    # expect(page).to have_content('Stray Hearts Taos Animal Shelter')
  end
end
