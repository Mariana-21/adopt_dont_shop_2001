require 'rails_helper'

describe "When a user add pets to their favorites" do 
    it "displays a message" do 
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
            click_button "Favorite"
        end

        expect(page).to have_content("You now have added #{pet_1.name} to your favorites!")
    end

    it "displays the total number of pets in the favorites" do 
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
                   shelter_id: shelter_2.id)

        visit "/pets"

        expect(page).to have_content("Favorites: 0")

        within("#pet-#{pet_1.id}") do 
            click_button "Favorite"
        end

        expect(page).to have_content("Favorites: 1")

        within("#pet-#{pet_2.id}") do 
            click_button "Favorite"
        end

        expect(page).to have_content("Favorites: 2")

        within("#pet-#{pet_3.id}") do 
            click_button "Favorite"
        end

        expect(page).to have_content("Favorites: 3")
    end
end
