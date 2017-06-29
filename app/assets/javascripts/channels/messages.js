var user = document.querySelector('#messages');

if (user) {
  var data = user.dataset;
}



App.messages = App.cable.subscriptions.create('MessagesChannel', {
  received: function(data) {
    // if (data.message.trim() !== "" && data.message !== null) {
      $("#messages").removeClass('hidden');
      $('#messages').append(this.renderMessage(data));
      // $('.chat-background').animate({scrollTop:$('.chat-background').height()}, 'slow');
       return $('.chat-background').animate({scrollTop: 9999}, '10000');
    // }
  },

  renderMessage: function(data) {

    var myMessage = "<div class='row margin-0'><div class='col-xs-10 padding-0'><div class='chat-bubble chat-relative'><span clas='my-message'>" + data.message + "</span><span class='chat-absolute'>" + data.time + "</span></div></div>";
    var userMessage = "<div class='row margin-0'><div class='col-xs-10 col-xs-offset-2 padding-0'><div class='chat-bubble-user pull-right chat-relative'><span clas='user-message'>" + data.message + "</span><span class='chat-absolute'>" + data.time + "</span></div></div>";

    if (user.dataset.user == 'user' &&  data.from == 'user') {
      return myMessage;
    } else if (user.dataset.user == 'user' && data.from == 'artist') {
      return userMessage;
    } else if (user.dataset.user == 'artist' && data.from == 'artist') {
      return myMessage;
    } else if (user.dataset.user == 'artist' && data.from == 'user') {
      return userMessage;
    }
  }
});

