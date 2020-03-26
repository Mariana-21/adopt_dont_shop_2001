require 'rails_helper'

RSpec.describe "as a user", type: :feature do
  it "can see all pets associated with a shelter, including image, name, approximate age and sex" do

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

    pet_5 = Pet.create(image: "https://media1.popsugar-assets.com/files/thumbor/fe_TEBbRM3ZlH2WR2P-pI5hbqSI/876x0:4381x3505/fit-in/2048xorig/filters:format_auto-!!-:strip_icc-!!-/2019/12/18/763/n/46902966/4759e2855dfa5f7c857892.88399573_/i/what-kind-health-problems-do-golden-retrievers-have.jpg",
                       name: "Rover",
                       description: "Hi, I’m Rover, I’m a Golden Retriever. I love road trips, especially trips where we stop at lots of lakes along the way. Camping is also a blast, I enjoy sitting with my person, hopefully you, by the fire and roasting marshmallows. Come meet me today! I’m sure we will have lots of adventures together.",
                       approximate_age: "10 m/o",
                       sex: "Male",
                       adoption_status: "Pending Adoption",
                       shelter_id: shelter_1.id)

    shelter_2 = Shelter.create(name: "Humane Society of Boulder Valley",
                               address: "2323 55th St",
                               city: "Boulder",
                               state: "CO",
                               zip: "80301")

    pet_3 = Pet.create(image: "https://i.pinimg.com/originals/83/c7/1c/83c71cdc4efeeb1b27b524718f646b73.jpg",
                       name: "Cookie",
                       description: "I'm Cookie. I'm a Nova Scotia Duck Tolling Terrier. I'm energetic and playful, a perfect companion for hikes or runs. I love playing fetch and swimming in lakes. I know lots of fun tricks like roll over, high-five and speak. Come say hi! I'm sure we'll be a great match!",
                       approximate_age: "1 y/o",
                       sex: "Female",
                       adoption_status: "Adoptable",
                       shelter_id: shelter_2.id)

    pet_4 = Pet.create(image: "https://www.petmd.com/sites/default/files/samoyed-dog-picture-id181956647.jpg",
                       name: "Marshmallow",
                       description: "Marshmallow, here. I'm a Samoyed, essentially just a big fluff. I'm playful and fun and enjoy romping in the snow. Like Elsa says 'the cold never bothered me anyway,' I'm a quick learner and love training of any kind! I'm looking for my forever home, come meet me!",
                       approximate_age: "3 y/o",
                       sex: "Female",
                       adoption_status: "Adoptable",
                       shelter_id: shelter_2.id)


    visit "/shelters/#{shelter_1.id}/pets"

    #Shelter 1
    expect(page).to have_css("img[src*='#{pet_1.image}']")
    expect(page).to have_content(pet_1.name)
    expect(page).to have_content("Approximate Age: #{pet_1.approximate_age}")
    expect(page).to have_content("Sex: #{pet_1.sex}")
    expect(page).to_not have_content(pet_1.description)
    expect(page).to_not have_content(pet_1.adoption_status)

    expect(page).to have_css("img[src*='#{pet_2.image}']")
    expect(page).to have_content(pet_2.name)
    expect(page).to have_content("Approximate Age: #{pet_2.approximate_age}")
    expect(page).to have_content("Sex: #{pet_2.sex}")
    expect(page).to_not have_content(pet_2.description)
    expect(page).to_not have_content(pet_2.adoption_status)

    expect(page).to_not have_css("img[src*='#{pet_5.image}']")
    expect(page).to_not have_content(pet_5.name)
    expect(page).to_not have_content("Approximate Age: #{pet_5.approximate_age}")
    expect(page).to_not have_content(pet_5.description)
    expect(page).to_not have_content(pet_5.adoption_status)

    # Shelter 2
    expect(page).to_not have_css("img[src*='#{pet_3.image}']")
    expect(page).to_not have_content(pet_3.name)
    expect(page).to_not have_content("Approximate Age: #{pet_3.approximate_age}")
    expect(page).to_not have_content("Sex: #{pet_3.sex}")
    expect(page).to_not have_content(pet_3.description)
    expect(page).to_not have_content(pet_3.adoption_status)

    expect(page).to_not have_css("img[src*='#{pet_4.image}']")
    expect(page).to_not have_content(pet_4.name)
    expect(page).to_not have_content("Approximate Age: #{pet_4.approximate_age}")
    expect(page).to_not have_content("Sex: #{pet_4.sex}")
    expect(page).to_not have_content(pet_4.description)
    expect(page).to_not have_content(pet_4.adoption_status)
  end
end
