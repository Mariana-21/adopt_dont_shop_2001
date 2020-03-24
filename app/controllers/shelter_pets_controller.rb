class ShelterPetsController < ApplicationController
  def index
    @shelter_pet = Shelter.find(params[:shelter_id])
  end

  def new
  end

  def create

    pet = Pet.new(pet_params)
    pet.adoption_status = "Adoptable"

    pet.save

    shelter_pet = Shelter.find(params[:shelter_id])
    redirect_to "/shelters/#{shelter_pet.id}/pets"
  end

private
  def pet_params
    params.permit(:image, :name, :description, :approximate_age, :sex, :adoption_status, :shelter_id)
  end
end
