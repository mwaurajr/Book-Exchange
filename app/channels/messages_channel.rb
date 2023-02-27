class MessagesChannel < ApplicationCable::Channel
  before_action :authenticate_user!
  
  def subscribed
    stream_from "messages_#{params[:conversation_id]}"
  end

  def unsubscribed
    ActionCable.server.broadcast "chat_channel", message: "#{current_user.username} has left the chat"
  end
end
