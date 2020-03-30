class FavoritesController < ApplicationController
  def update
      pet = Pet.find(params[:pet_id])
      favorite.add_pet(pet.id)
      session[:favorite]
      quantity = favorite.count_of
      flash[:notice] = "You now have added #{pet.name} to your favorites!"
      redirect_to '/pets'
  end

  def destroy
    pet = Pet.find(params[:pet_id])
    favorite.remove_pet(pet.id)
    session[:favorite] = favorite.pets

    flash[:notice] = "#{pet.name} has been removed from your favorites."
    redirect_to "/pets/#{pet.id}"
  end
end
