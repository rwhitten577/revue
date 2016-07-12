$(document).ready(function() {
  $('.upvote').on('click', function(e) {
     e.preventDefault();

     var $this = $(this);
     var reviewId = $this.data('reviewid');
     var venueId = $this.data('venueid');

     $.post('/venues/' + venueId + '/reviews/' + reviewId + '/upvote')
      .done(function(resp) {
        $('.total-votes-' + resp.review_id ).html(resp.votes_count);
      })
   })

  $('.downvote').on('click', function(e) {
     e.preventDefault();

     var $this = $(this);
     var reviewId = $this.data('reviewid');
     var venueId = $this.data('venueid');

     $.post('/venues/' + venueId + '/reviews/' + reviewId + '/downvote')
      .done(function(resp) {
         $('.total-votes-' + resp.review_id ).html(resp.votes_count);
      })
  });
})
