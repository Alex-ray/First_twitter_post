
$(document).on('submit', '#send_tweet', function(event){
  
  event.preventDefault();

  $target = $(event.target);
  data = $target.serialize();

  $.ajax({
    url: '/tweet/new',
    type: 'post',
    data: data,
    success: function(text) {
        $('.container').append("<h2>"+text+"</h2>");
    }
  });
  
});

