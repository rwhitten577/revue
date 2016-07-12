$(document).ready(function() {
  $('.upvote').on('click', function(e) {
     e.preventDefault();

     var $this = $(this);
     var reviewId = $this.data('reviewid');

     $.post('/reviews/' + reviewId + '/votes')
      .done(function(resp) {
        debugger;
        $('.total-votes-' + resp.review_id ).html(resp.votes_count);
      })
   })

  $('.downvote').on('click', function(e) {
     e.preventDefault();

     var $this = $(this);
     var reviewId = $this.data('reviewid');
     var venueId = $this.data('venueid');

     $.post('/reviews/' + reviewId + '/votes')
      .done(function(resp) {
         $('.total-votes-' + resp.review_id ).html(resp.votes_count);
      })
  });
})
