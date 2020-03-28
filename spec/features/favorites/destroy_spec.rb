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

    visit '/pets'

    within("#pet-#{pet_1.id}") do
      expect(page).to have_button("Favorite")

      click_button "Favorite"
      pet_1.reload

      expect(page).to_not have_button("Favorite")
      expect(page).to have_button("Remove #{pet_1.name} From Favorites")

      click_button "Remove #{pet_1.name} From Favorites"

      expect(current_path).to eq("/pets/#{pet_1.id}")

      expect(page).to have_content("#{pet_1.name} has been removed from your favorites.")

      expect(page).to have_button("Favorite")
      expect(page).to_not have_button("Remove #{pet_1.name} From Favorites")
    end

  end
end

# And I also see that my favorites indicator has decremented by 1
