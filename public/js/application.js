$(document).on('submit', '#send_tweet', function(event){
  
  event.preventDefault();

  var form = $(this);
  var data = form.serialize();

  $.ajax({
    url: '/tweet/new',
    type: 'post',
    data: data,
    success: function(job_id){
      debugger;
      console.log(job_id);
      // setTimeout(function(){ untilJobDone(job_id); }, 1000);
    }
  });

});

function untilJobDone(job_id){
  $.ajax({
    url: "/status/"+job_id,
    type: 'get',
    success: function(job_status){

      if (job_status == "done") { 
        console.log("ITS DONE", job_id);
        $('.tweet-status').replaceWith("<h2>Your tweet has been posted</h2>");
      }

      if (job_status == "running") { 
        setTimeout(function(){ untilJobDone(job_id); }, 1000); 
      }

      if (job_status == "failed") { 
        $('.tweet-status').replaceWith("<h2>Something bad happened : (</h2>");
      }
    }
  });
}

