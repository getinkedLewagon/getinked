class ChatroomsController < ApplicationController
  skip_before_action :authenticate_user!

  def show
    @chatroom = Chatroom.find(params[:id])
    @message = Message.new
  end
end
