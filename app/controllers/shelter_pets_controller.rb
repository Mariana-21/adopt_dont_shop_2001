class ShelterPetsController < ApplicationController
  def index
    @shelter_pet = Shelter.find(params[:shelter_id])
  end
end
