class AdoptionsController < ApplicationController

    def new
        @adoption = Adoption.all
        @favorites = favorite.pets.map { |pet_id| Pet.find(pet_id.to_i) }
    end

    def create
        adoption = Adoption.create(adoption_params)

        adoption.save 

        redirect_to '/favorites'
    end

    private 

    def adoption_params
        params.permit(:name, :address, :city, :state, :zip, :phone, :description)
    end
end