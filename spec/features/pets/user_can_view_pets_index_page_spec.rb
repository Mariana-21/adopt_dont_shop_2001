require 'rails_helper'

RSpec.describe "as a user", type: :feature do
  it "can see all pets in system, including image, name, approximate age, sex, and shelter" do

    shelter_1 = Shelter.create(name: "Adams County Animal Shelter",
      address: "10705 Fulton St",
      city: "Brighton",
      state: "CO",
      zip: "80601")

    pet_1 = Pet.create(image: "https://i.pinimg.com/originals/a6/0f/7f/a60f7f075fcbe60956a31179c5eff08c.jpg",
                       name: "Spyro",
                       description: "My name is Spyro. I love long walks in the park.. or uhh... anywhere really... and hanging with my pals. I work hard and I play hard, even if I don't work hard. 'Swipe right' if you want an energetic pal to go on hikes with.",
                       approximate_age: "2 y/o",
                       sex: "Male",
                       adoption_status: "Adoptable",
                       shelter_id: shelter_1.id)

    visit "/pets"

    expect(page).to have_css("img[src*='#{pet_1.image}']")
    expect(page).to have_content(pet_1.name)
    expect(page).to have_content(pet_1.approximate_age)
    expect(page).to have_content(pet_1.sex)
    expect(page).to have_content(shelter_1.name)

    expect(page).to_not have_content(pet_1.description)
    expect(page).to_not have_content(pet_1.adoption_status)
  end
end
