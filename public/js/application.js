
$(document).on('submit', '#send_tweet', function(event){
  
  event.preventDefault();

  $target = $(event.target);
  data = $target.serialize();

  $.ajax({
    url: '/tweet/new',
    type: 'post',
    data: data,
    success: function(job_id) {
        $('.container').append("<h2>"+job_id+"</h2>");
    }
  });
  
});

