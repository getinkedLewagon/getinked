var user = document.querySelector('#messages'),
data = user.dataset;



App.messages = App.cable.subscriptions.create('MessagesChannel', {
  received: function(data) {
    // if (data.message.trim() !== "" && data.message !== null) {
      $("#messages").removeClass('hidden');
      $('#messages').append(this.renderMessage(data));
      return $('html, body').animate({scrollTop:$(document).height()}, 'slow');
    // }
  },

  renderMessage: function(data) {

    var myMessage = "<div class='row margin-0'><div class='col-xs-8 text-left padding-0'><p class='chat-bubble my-message'>" + data.message + "</p></div></div>";
    var userMessage = "<div class='row margin-0'><div class='col-xs-8 col-xs-offset-4 text-left padding-0'><p class='chat-bubble user-message'>" + data.message + "</p></div></div>";

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


