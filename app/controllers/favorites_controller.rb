class FavoritesController < ApplicationController
  def index
    @favorites = favorite.pets.map { |pet_id| Pet.find(pet_id.to_i) }
    if favorite.pets.length == 0
      flash[:notice] = "Oh no! You haven't favorited any pets. Go find a pet you love!"
    end
  end

  def update
      pet = Pet.find(params[:pet_id])
      favorite.add_pet(pet.id)
      session[:favorite] = favorite.pets
      flash[:notice] = "You now have added #{pet.name} to your favorites!"
      redirect_to "/pets/#{pet.id}"
  end

  def destroy
    if request.env['PATH_INFO'] == '/favorites'
      favorite.remove_all
    else
      pet = Pet.find(params[:pet_id])
      favorite.remove_pet(pet.id)
      session[:favorite] = favorite.pets
      flash[:notice] = "#{pet.name} has been removed from your favorites."
    end

    redirect_to(request.env["HTTP_REFERER"])
  end
end
