require 'rails_helper'
RSpec.describe "as a user", type: :feature do
  it "can delete a review" do
    shelter_1 = Shelter.create(name: "Adams County Animal Shelter",
                               address: "10705 Fulton St",
                               city: "Brighton",
                               state: "CO",
                               zip: "80601")
    review_1 = shelter_1.reviews.create(title: "Found my best friend!",
                             rating: "5",
                             content: "The staff was very friendly and allowe dme to take my time meeting with any dog I thought was a godo fit. They even allowed and encouraged me to bring my other dog to meet one of the pups I was interested in. This flexibility helped me make sure the dog I met with was a good fit. I've found my new best friend!",
                             picture: "https://www.pedigreedatabase.com/uploads/Reliya/images/13592736_10208042346674904_51006761307976618_n-1.jpg")


    visit "/shelters/#{shelter_1.id}"

    expect(page).to have_link("Delete Review")
    
    within("#review-#{review_1.id}") do
      click_link("Delete Review")
    end

    expect(current_path).to eq("/shelters/#{shelter_1.id}")

    expect(page).to_not have_content(review_1.title)
    expect(page).to_not have_content("Rating: #{review_1.rating}")
    expect(page).to_not have_content("More Information: #{review_1.content}")
    expect(page).to_not have_content(review_1.picture)
  end
end
