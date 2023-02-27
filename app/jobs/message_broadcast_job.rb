class MessageBroadcastJob < ApplicationJob
  queue_as :default

  def perform(message)
    # Broadcast message to conversation channel
    MessagesChannel.broadcast_to(message.conversation, render_message(message))
  end

  private

  # Renders a message as HTML using a partial
  def render_message(message)
    ApplicationController.renderer.render(partial: 'messages/message', locals: { message: message })
  end
end
