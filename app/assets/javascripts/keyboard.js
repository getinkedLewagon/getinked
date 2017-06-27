  $(document).ready(function () {
    console.log('Hello!');
    $('textarea#message_content').keydown(function(event) {
      if (event.keyCode == 13) {
        $('[data-send="message"]').click();
        $('[data-textarea="message"]').val(" ")
        return false;
     }
    })
  });
