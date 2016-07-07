class ReviewsController < ApplicationController
  def create
    @review = Review.new(review_params)
    @venue = Venue.find(params[:venue_id])
    @review.venue = @venue
    if @review.save
      flash[:notice] = "Review successfully added!"
      redirect_to venue_path(@venue)
    else
      flash[:notice] = "There were problems saving your review."
      flash[:errors] = @review.errors.full_messages.join(', ')
      render :venue
    end
  end

  def new
    @venue = Venue.find(params[:venue_id])
    @review = Review.new
  end

  def edit
    @review = Review.find(params[:id])
  end

  def update
    @review = Review.find(params[:id])
    if @review.update(review_params)
      flash[:notice] = "Review successfully edited!"
      redirect_to venue_path(@venue)
    else
      flash[:notice] = "There were problems saving your review."
      flash[:errors] = @review.errors.full_messages.join(', ')
      render :venue
    end
  end

  def destroy
    @review = Review.find(params[:id])
    @review.destroy
    flash[:notice] = "Review deleted!"
    redirect_to venues_path
  end

  private

  def review_params
    params.require(:review).permit(:description, :rating, :upvotes, :downvotes)
  end
end
