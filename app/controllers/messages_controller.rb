class MessagesController < ApplicationController
  skip_before_action :authenticate_user!

  def create
    @message = Message.new(message_params)
    @message.user = @message.chatroom.appointment.user
    @message.artist = @message.chatroom.appointment.artist
    if @message.save && current_user
      ActionCable.server.broadcast 'messages',
      message: @message.content,
      user: @message.user.username,
      from: 'user'
      head :ok
    elsif @message.save && current_artist
     ActionCable.server.broadcast 'messages',
     message: @message.content,
     artist: @message.artist.email,
     from: 'artist'
     head :ok
   end
 end

 private

 def message_params
  params.require(:message).permit(:content, :chatroom_id, :from)
end
end

