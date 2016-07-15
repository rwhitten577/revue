class ReviewMailer < ApplicationMailer
  def new_review(review)
    @review = review
    mail(
      to: @review.venue.user.email,
      subject: "New review for #{review.venue.name}"
    )
  end
end
