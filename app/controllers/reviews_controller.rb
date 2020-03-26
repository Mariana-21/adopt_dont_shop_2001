class ReviewsController < ApplicationController
  def edit
    @shelter = Shelter.find(params[:id])
    @review = Review.find(params[:review_id])
  end

  def new
    @shelter = Shelter.find(params[:id])
  end

  def create
    shelter = Shelter.find(params[:id])
    review = shelter.reviews.create(review_params)
    review.save
    redirect_to "/shelters/#{shelter.id}"
  end

private
  def review_params
    params.permit(:title, :rating, :content, :picture)
  end
end
