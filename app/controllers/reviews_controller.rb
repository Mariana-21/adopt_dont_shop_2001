class ReviewsController < ApplicationController
  def edit
    @shelter = Shelter.find(params[:id])
    @review = Review.find(params[:review_id])
  end

  def new
    @shelter = Shelter.find(params[:id])
  end

  def create
    @shelter = Shelter.find(params[:id])
    review = @shelter.reviews.create(review_params)
    # require "pry"; binding.pry
    if review.save
      redirect_to "/shelters/#{@shelter.id}"
    elsif !review.save
      flash[:notice] = "Review not submitted. Missing one or more of the following fields: Title, Rating or Additonal Information."
      render :new
    end
  end

private
  def review_params
    params.permit(:title, :rating, :content, :picture)
  end
end
