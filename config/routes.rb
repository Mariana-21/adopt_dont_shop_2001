Rails.application.routes.draw do
  get '/shelters/new', to: 'shelters#new'
  post '/shelters', to: 'shelters#create'
  get '/shelters', to: 'shelters#index'
  get '/shelters/:shelter_id', to: 'shelters#show'
  get '/shelters/:shelter_id/edit', to: 'shelters#edit'
  patch '/shelters/:shelter_id', to: 'shelters#update'
  delete '/shelters/:shelter_id', to: 'shelters#destroy'

  get '/shelters/:shelter_id/pets', to: 'shelter_pets#index'

  get '/shelters/:shelter_id/pets/new', to: 'pets#new'
  post '/shelters/:shelter_id/pets', to: 'pets#create'
  get '/pets', to: 'pets#index'
  get '/pets/:pet_id', to: 'pets#show'
  get '/pets/:pet_id/edit', to: 'pets#edit'
  patch '/pets/:pet_id', to: 'pets#update'
  delete '/pets/:pet_id', to: 'pets#destroy'

  post '/shelters/:id', to: 'reviews#create'
  get '/shelters/:id/new', to: 'reviews#new'
  get '/shelters/:id/:review_id/edit', to: 'reviews#edit'
  patch '/shelters/:id/:review_id', to: 'reviews#update'
  delete '/shelters/:id/:review_id', to: 'reviews#destroy'

  patch '/favorites/:pet_id', to: 'favorites#update'
  get '/favorites', to: 'favorites#index'
  delete '/favorites/:pet_id', to: 'favorites#destroy'
  delete '/favorites', to: 'favorites#destroy'
end
