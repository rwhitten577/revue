$(document).ready(function() {
  $('.upvote').on('click', function(e) {
     e.preventDefault();

     var $this = $(this);
     var reviewId = $this.data('reviewid');

     var request = $.ajax({
        method: "POST",
        url: '/reviews/' + reviewId + '/votes',
        data: { value: 1 }
      });

      request.done(function(data) {
        $('.total-votes-' + data.review_id ).html(data.votes_count);
      })
   })

  $('.downvote').on('click', function(e) {
     e.preventDefault();

     var $this = $(this);
     var reviewId = $this.data('reviewid');

     var request = $.ajax({
        method: "POST",
        url: '/reviews/' + reviewId + '/votes',
        data: { value: -1 }
      });

      request.done(function(data) {
        $('.total-votes-' + data.review_id ).html(data.votes_count);
      })
  });
})
