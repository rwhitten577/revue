class ReviewsController < ApplicationController
  def create
    @review = Review.new(review_params)
    @venue = Venue.find(params[:venue_id])
    @review.venue = @venue
    @review.user = current_user
    if @review.save
      flash[:notice] = "Review successfully added!"
      redirect_to venue_path(@venue)
    else
      flash[:notice] = "There were problems saving your review."
      flash[:errors] = @review.errors.full_messages.join(', ')
      render :new
    end
  end

  def new
    @venue = Venue.find(params[:venue_id])
    @review = Review.new
    unless user_signed_in?
      flash[:notice] = "You must be signed in to add a new review"
      redirect_to venue_path(@venue)
    end
  end

  def edit
    @venue = Venue.find(params[:venue_id])
    @review = Review.find(params[:id])
  end

  def update
    @venue = Venue.find(params[:venue_id])
    @review = Review.find(params[:id])
    @review.venue = @venue
    if @review.update(review_params)
      flash[:notice] = "Review successfully edited!"
      redirect_to venue_path(@venue)
    else
      flash[:notice] = "There were problems saving your review."
      flash[:errors] = @review.errors.full_messages.join(', ')
      redirect_to venue_path(@venue)
    end
  end

  def destroy
    @review = Review.find(params[:id])
    @venue = Venue.find(params[:venue_id])
    @review.destroy
    flash[:notice] = "Review deleted!"
    redirect_to venue_path(@venue)
  end

  private

  def review_params
    params.require(:review).permit(:venue_id, :description, :rating, :upvotes, :downvotes)
  end
end
