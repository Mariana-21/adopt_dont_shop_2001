require 'rails_helper'

describe "As a visitor" type: :feature do 
    it "can apply to adopt for my favorite  pets" do 
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

    visit "/pets/#{pet_1.id}"
    click_link "Add to Favorites"
    visit "/pets/#{pet_2.id}"
    click_link "Add to Favorites"
    visit "/pets/#{pet_3.id}"
    click_link "Add to Favorites"
    expect(page).to have_content("Favorites: 3")
    
    visit "/favorites"
    click_link "Start Apdotion"

    expect(current_path).to eq 

    expect(page).to have_field('Name')
    expect(page).to have_field('Address')
    expect(page).to have_field('City')
    expect(page).to have_field('State')
    expect(page).to have_field('Zip')
    expect(page)



# As a visitor
# When I have added pets to my favorites list
# And I visit my favorites page ("/favorites")
# I see a link for adopting my favorited pets
# When I click that link I'm taken to a new application form
# At the top of the form, I can select from the pets of which I've favorited for which I'd like this application to apply towards (can be more than one)
# When I select one or more pets, and fill in my
# - Name
# - Address
# - City
# - State
# - Zip
# - Phone Number
# - Description of why I'd make a good home for this/these pet(s)
# And I click on a button to submit my application
# I see a flash message indicating my application went through for the pets that were selected
# And I'm taken back to my favorites page where I no longer see the pets for which I just applied listed as favorites
