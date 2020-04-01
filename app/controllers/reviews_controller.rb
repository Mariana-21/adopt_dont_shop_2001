class ReviewsController < ApplicationController
  def edit
    @review = Review.find(params[:review_id])
    @shelter = Shelter.find(params[:shelter_id])
  end

  def update
    @shelter = Shelter.find(params[:shelter_id])
   review = Review.find(params[:review_id])
   review.update(review_params)
    if review.save
      redirect_to "/shelters/#{review.shelter.id}"
    elsif !review.save
      flash[:notice] = "Review not updated: Required information missing."
      redirect_to "/shelters/#{review.shelter.id}/reviews/#{review.id}/edit"
    end
  end

  def new
    @shelter = Shelter.find(params[:shelter_id])
  end

  def create
    @shelter = Shelter.find(params[:shelter_id])

    review = @shelter.reviews.create(review_params)
    if review.save
      redirect_to "/shelters/#{@shelter.id}"
    elsif !review.save
      flash[:notice] = "Review not submitted. Missing one or more of the following fields: Title, Rating or Additonal Information."
      render :new
    end
  end

  def destroy
    @shelter = Shelter.find(params[:shelter_id])
    Review.destroy(params[:review_id])
    redirect_to "/shelters/#{@shelter.id}"
  end

private
  def review_params
    params.permit(:title, :rating, :content, :picture)
  end
end
