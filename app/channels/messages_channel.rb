class MessagesChannel < ApplicationCable::Channel
  def subscribed
    stream_from "messages_channel"
  end

  def unsubscribed
    ActionCable.server.broadcast "chat_channel", message: "#{current_user.username} has left the chat"
  end
end