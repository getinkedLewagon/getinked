
var user = document.querySelector('#messages');

if (user) {
  var data = user.dataset;
}

App.messages = App.cable.subscriptions.create('MessagesChannel', {
  received: function(data) {
    $("#messages").removeClass('hidden');
    $('#message_content').val('');
    return $('#messages').append(this.renderMessage(data));
  },

  renderMessage: function(data) {
    if (user.dataset.user == 'user' &&  data.from == 'user') {
      return "<p> <b>" + 'You' + ": </b>" + data.message + "</p>";
    } else if (user.dataset.user == 'user' && data.from == 'artist') {
      return "<p> <b>" + data.artist + ": </b>" + data.message + "</p>";
    } else if (user.dataset.user == 'artist' && data.from == 'artist') {
      return "<p> <b>" + 'You' + ": </b>" + data.message + "</p>";
    } else if (user.dataset.user == 'artist' && data.from == 'user') {
      return "<p> <b>" + data.user + ": </b>" + data.message + "</p>";
    }
  }
});
