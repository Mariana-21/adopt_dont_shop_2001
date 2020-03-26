require 'rails_helper'

RSpec.describe "as a user", type: :feature do
  it "can update a pets information" do

    shelter_1 = Shelter.create(name: "Adams County Animal Shelter",
                               address: "10705 Fulton St",
                               city: "Brighton",
                               state: "CO",
                               zip: "80601")

    pet_1 = Pet.create(image: "https://i.pinimg.com/originals/a6/0f/7f/a60f7f075fcbe60956a31179c5eff08c.jpg",
                       name: "Spyro",
                       description: "My name is Spyro. I'm a Belgian Malinois. I love long walks in the park.. or uhh... anywhere really... and hanging with my pals. I work hard and I play hard, even if I don't work hard. 'Swipe right' if you want an energetic pal to go on hikes with.",
                       approximate_age: "2 y/o",
                       sex: "Male",
                       adoption_status: "Adoptable",
                       shelter_id: shelter_1.id)

    visit "/pets/#{pet_1.id}"

    click_link('Update Pet')

    expect(current_path).to eq("/pets/#{pet_1.id}/edit")

    fill_in 'Image', with: 'https://i.redd.it/xflds111b8o01.jpg'
    fill_in 'Name', with: 'Marshmallow'
    fill_in 'Description', with: "Marshmallow, here. I'm a Samoyed, essentially just a big fluff. I'm playful and fun and enjoy romping in the snow. Like Elsa says 'the cold never bothered me anyway,' I'm a quick learner and love training of any kind! I'm looking for my forever home, come meet me!"
    fill_in 'Approximate Age', with: '3 y/o'
    select 'Female', from: 'Sex'
    click_button 'Update Pet'

    expect(current_path).to eq("/pets/#{pet_1.id}")

    expect(page).to have_css("img[src*='#{"https://i.redd.it/xflds111b8o01.jpg"}']")
    expect(page).to have_content("Marshmallow")
    expect(page).to have_content("Marshmallow, here. I'm a Samoyed, essentially just a big fluff. I'm playful and fun and enjoy romping in the snow. Like Elsa says 'the cold never bothered me anyway,' I'm a quick learner and love training of any kind! I'm looking for my forever home, come meet me!")
    expect(page).to have_content("3 y/o")
    expect(page).to have_content("Female")
    expect(page).to have_content("Adoptable")
 end
end
