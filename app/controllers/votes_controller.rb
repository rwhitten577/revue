class VotesController < ApplicationController
  before_action :set_review

  skip_before_action :verify_authenticity_token

  def create_upvote
    upvote = @review.upvotes.build
    upvote.user = current_user

    if upvote.save
      @review.update_attributes(sum_votes: @review.votes_total)
      @review.save
      render json: { votes_count: @review.votes_total, review_id: @review.id }
    end
  end

  def create_downvote
    downvote = @review.downvotes.build
    downvote.user = current_user

    if downvote.save
      @review.update_attributes(sum_votes: @review.votes_total)
      @review.save
      render json: { votes_count: @review.votes_total, review_id: @review.id }
    end
  end

  private

  def set_review
    @review = Review.find(params[:review_id])
  end
end
