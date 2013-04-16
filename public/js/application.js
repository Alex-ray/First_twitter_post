
$(document).on('submit', 'form', function(event){
  
  event.preventDefault();

  $target = $(event.target);
  data = $target.serialize();

  $.ajax({
    url: '/tweet',
    type: 'post',
    data: data,
    success: function() {
        $('.container').append("<h2>Tweeeeeeeted!</h2>");
    }
  });
  
});

