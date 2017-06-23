 $(function(){





setInterval(function(){

  var messagesDiv = $('#messageslist');


  $.ajax({
       type: "GET",
       url: "/dashboard",
      success: function(data) {


        messagesDiv.html($(data).find('#messageslist'));

       },
       error: function(jqXHR) {
         console.error(jqXHR.responseText);
       }
    });


}, 2000);



 });
