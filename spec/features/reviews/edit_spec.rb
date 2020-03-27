require 'rails_helper'
RSpec.describe "as a user", type: :feature do
  it "can see all reviews for that shelter" do
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

    click_link("Edit Review")

    expect(current_path).to eq("/shelters/#{shelter_1.id}/#{review_1.id}/edit")

    expect(page).to have_field("Title")
    expect(page).to have_field("Rating")
    expect(page).to have_field("Additonal Information")
    expect(page).to have_field("Picture URL (Optional)")

    fill_in "Title", with: "Found my best friend!"
    fill_in "Rating", with: "5"
    fill_in "Additonal Information", with: "The staff was very friendly and allowed me to take my time meeting with any dog I thought was a good fit. They even allowed and encouraged me to bring my other dog to meet one of the pups I was interested in. This flexibility helped me make sure the dog I met with was a good fit. I've found my new best friend!"
    fill_in "Picture URL (Optional)", with: "https://www.pedigreedatabase.com/uploads/Reliya/images/13592736_10208042346674904_51006761307976618_n-1.jpg"
    click_button("Update Review")

    expect(current_path).to eq("/shelters/#{shelter_1.id}")

    expect(page).to have_content("Found my best friend!")
    expect(page).to have_content("5")
    expect(page).to have_content("The staff was very friendly and allowed me to take my time meeting with any dog I thought was a good fit. They even allowed and encouraged me to bring my other dog to meet one of the pups I was interested in. This flexibility helped me make sure the dog I met with was a good fit. I've found my new best friend!")
    expect(page).to have_css("img[src*='https://www.pedigreedatabase.com/uploads/Reliya/images/13592736_10208042346674904_51006761307976618_n-1.jpg']")
  end
end
