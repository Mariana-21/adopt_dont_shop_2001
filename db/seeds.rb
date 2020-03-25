# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
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

pet_5 = Pet.create(image: "https://media1.popsugar-assets.com/files/thumbor/fe_TEBbRM3ZlH2WR2P-pI5hbqSI/876x0:4381x3505/fit-in/2048xorig/filters:format_auto-!!-:strip_icc-!!-/2019/12/18/763/n/46902966/4759e2855dfa5f7c857892.88399573_/i/what-kind-health-problems-do-golden-retrievers-have.jpg",
                   name: "Rover",
                   description: "Hi, I’m Rover, I’m a Golden Retriever. I love road trips, especially trips where we stop at lots of lakes along the way. Camping is also a blast, I enjoy sitting with my person, hopefully you, by the fire and roasting marshmallows. Come meet me today! I’m sure we will have lots of adventures together.",
                   approximate_age: "10 m/o",
                   sex: "Male",
                   adoption_status: "Pending Adoption",
                   shelter_id: shelter_1.id)


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

review_1 = shelter_1.reviews.create(title: "Found my best friend!",
                                    rating: "5",
                                    content: "The staff was very friendly and allowe dme to take my time meeting with any dog I thought was a godo fit. They even allowed and encouraged me to bring my other dog to meet one of the pups I was interested in. This flexibility helped me make sure the dog I met with was a good fit. I've found my new best friend!",
                                    picture: "https://www.pedigreedatabase.com/uploads/Reliya/images/13592736_10208042346674904_51006761307976618_n-1.jpg",
                                    shelter_id: shelter_1.id)
review_2 = shelter_1.reviews.create(title: "All animals seemed very happy",
                                    rating: "5",
                                    content: "All animals seemed very happy and well taken care of. The kennels/cages were clean and each had a comfortable looking bed and a full water dish. Upon arriving I immediately noticed several volunteers and staff walking dogs or playing with them in the play yards.",
                                    shelter_id: shelter_1.id)
