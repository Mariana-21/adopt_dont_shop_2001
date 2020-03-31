require 'rails_helper'

describe "As as user" do
  it "cannot favorite a pet more than once" do
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

    visit "/pets/#{pet_1.id}"

    within("#pet-#{pet_1.id}") do
      expect(page).to have_link("Favorite")
      click_link "Add to Favorites"
      expect(page).to_not have_link("Add to Favorites")
      expect(page).to have_link("Remove #{pet_1.name} From Favorites")
    end

    expect(page).to have_content("Favorites: 1")

    within("#pet-#{pet_1.id}") do
      click_link "Remove #{pet_1.name} From Favorites"
      expect(page).to have_link("Add to Favorites")
      expect(page).to_not have_link("Remove #{pet_1.name} From Favorites")
    end

    expect(page).to have_content("Favorites: 0")
    expect(current_path).to eq("/pets/#{pet_1.id}")
    expect(page).to have_content("#{pet_1.name} has been removed from your favorites.")
  end

  it "can remove a pet from favorites on favorites page" do
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

    pet_2 = Pet.create(image: "https://dogsofsf.com/wp-content/uploads/2016/05/IMG_1391.jpg",
                       name: "Blitzen",
                       description: "Hi, I'm Blitzen. Throw a ball for me and we will be best friends! I'm a Pembroke Welsh Corgi so running, hiking and climbing are not my forte, I prefer cuddles and treats. I can be your Christmas anytime! Come meet me! I'm sure we will be best friends in no time!",
                       approximate_age: "4 y/o",
                       sex: "Male",
                       adoption_status: "Adoptable",
                       shelter_id: shelter_1.id)

    pet_3 = Pet.create(image: "https://i.pinimg.com/originals/83/c7/1c/83c71cdc4efeeb1b27b524718f646b73.jpg",
                       name: "Cookie",
                       description: "I'm Cookie. I'm a Nova Scotia Duck Tolling Terrier. I'm energetic and playful, a perfect companion for hikes or runs. I love playing fetch and swimming in lakes. I know lots of fun tricks like roll over, high-five and speak. Come say hi! I'm sure we'll be a great match!",
                       approximate_age: "1 y/o",
                       sex: "Female",
                       adoption_status: "Adoptable",
                       shelter_id: shelter_1.id)

    visit "/pets/#{pet_1.id}"
    click_link "Add to Favorites"

    visit "/pets/#{pet_2.id}"
    click_link "Add to Favorites"

    visit "/pets/#{pet_3.id}"
    click_link "Add to Favorites"

    expect(page).to have_content("Favorites: 3")

    visit "/favorites"

    within("#pet-#{pet_1.id}") do
      expect(page).to have_link("Remove #{pet_1.name} From Favorites")
    end
    within("#pet-#{pet_2.id}") do
      expect(page).to have_link("Remove #{pet_2.name} From Favorites")
    end
    within("#pet-#{pet_3.id}") do
      expect(page).to have_link("Remove #{pet_3.name} From Favorites")
      click_link "Remove #{pet_3.name} From Favorites"
    end
    expect(current_path).to eq("/favorites")
    expect(page).to have_content("Favorites: 2")
  end

  it "show a message when there are no favorites" do
    visit "/favorites"
    expect(page).to have_content("Oh no! You haven't favorited any pets. Go find a pet you love!")
  end
end
