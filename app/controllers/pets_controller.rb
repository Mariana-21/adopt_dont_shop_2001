class PetsController < ApplicationController
  def index
    @pets = Pet.all
    @favorites = Favorite.new(session[:favorite])
  end

  def show
    @pet = Pet.find(params[:pet_id])
  end

  def edit
    @pet = Pet.find(params[:pet_id])
  end

  def update
    pet = Pet.find(params[:pet_id])
    pet.update(pet_params)

    pet.save
    redirect_to "/pets/#{pet.id}"
  end

  def destroy
    Pet.destroy(params[:pet_id])
    redirect_to '/pets'
  end

private

  def pet_params
    params.permit(:image, :name, :description, :approximate_age, :sex, :adoption_status)
  end
end
