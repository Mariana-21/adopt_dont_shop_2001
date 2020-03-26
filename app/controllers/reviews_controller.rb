class ReviewsController < ApplicationController
  def edit
    @shelter = Shelter.find(params[:id])
    @review = Review.find(params[:review_id])
  end

  def new
  end
end
