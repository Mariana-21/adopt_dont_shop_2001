class AdoptionsController < ApplicationController

    def new
        @adoption = Adoption.all
        @favorites = favorite.pets.map { |pet_id| Pet.find(pet_id.to_i) }
    end

    def create
        adoption = Adoption.create(adoption_params)
        favorites = favorite.pets.map { |pet_id| Pet.find(pet_id.to_i) }

        adoption_pets = Pet.find(params[:adoptable_pet])
        if adoption.save 
            flash[:notice] = "Thank you for submitting your application!"
            redirect_to '/favorites'
            adoption_pets.each {|pet| favorite.remove_pet(pet.id.to_s)}
        elsif !adoption.save
            flash[:notice] = "Application not submitted. Missing one or more of the following fields: name, address, city, state, zip, phone or description"
            render :new
        end
    end

    private 

    def adoption_params
        params.permit(:name, :address, :city, :state, :zip, :phone, :description)
    end
end