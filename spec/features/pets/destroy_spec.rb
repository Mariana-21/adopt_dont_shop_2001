require 'rails_helper'

RSpec.describe "as a user", type: :feature do
  it "can delete a pet" do

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

    pet_2 = Pet.create(image: "https://dogsofsf.com/wp-content/uploads/2016/05/IMG_1391.jpg",
                       name: "Blitzen",
                       description: "Hi, I'm Blitzen. Throw a ball for me and we will be best friends! I'm a Pembroke Welsh Corgi so running, hiking and climbing are not my forte, I prefer cuddles and treats. I can be your Christmas anytime! Come meet me! I'm sure we will be best friends in no time!",
                       approximate_age: "4 y/o",
                       sex: "Female",
                       adoption_status: "Adoptable",
                       shelter_id: shelter_1.id)

    visit "/pets/#{pet_1.id}"

    click_link('Delete Pet')

    expect(current_path).to eq("/pets")

    expect(page).to_not have_css("img[src*='#{pet_1.image}']")
    expect(page).to_not have_content(pet_1.name)
    expect(page).to_not have_content(pet_1.approximate_age)
    expect(page).to_not have_content(pet_1.sex)
    expect(page).to_not have_content(pet_1.adoption_status)
    expect(page).to_not have_content(pet_1.description)

    expect(page).to have_css("img[src*='#{pet_2.image}']")
    expect(page).to have_content(pet_2.name)
    expect(page).to have_content(pet_2.approximate_age)
    expect(page).to have_content(pet_2.sex)
    expect(page).to_not have_content(pet_2.adoption_status)
    expect(page).to_not have_content(pet_2.description)
  end
end
