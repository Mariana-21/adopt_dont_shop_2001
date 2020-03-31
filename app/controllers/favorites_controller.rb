class FavoritesController < ApplicationController
  def index
    @favorites = favorite.pets.map { |pet_id| Pet.find(pet_id.to_i) }
  end

  def update
      pet = Pet.find(params[:pet_id])
      favorite.add_pet(pet.id)
      session[:favorite] = favorite.pets
      flash[:notice] = "You now have added #{pet.name} to your favorites!"
      redirect_to "/pets/#{pet.id}"
  end

  def destroy
    pet = Pet.find(params[:pet_id])
    favorite.remove_pet(pet.id)
    session[:favorite] = favorite.pets
    redirect_to(request.env["HTTP_REFERER"])

    flash[:notice] = "#{pet.name} has been removed from your favorites."
  end
end
