class MessagesController < ApplicationController
  before_action :authenticate_user!

  def create
    conversation = Conversation.find_or_create_by(
      sender_id: current_user.id,
      recipient_id: params[:recipient_id]
    )
    message = conversation.messages.build(message_params.merge(user_id: current_user.id))
    if message.save
      # Broadcast message to conversation channel
      MessagesChannel.broadcast_to(conversation, render_message(message))
      render json: message, status: :created
    else
      render json: message.errors, status: :unprocessable_entity
    end
  end

  def index
    conversation = Conversation.find(params[:conversation_id])
    messages = conversation.messages.order(created_at: :asc)
    render json: messages
  end

  private

  def message_params
    params.require(:message).permit(:body)
  end

  # Renders a message as HTML using a partial
  def render_message(message)
    ApplicationController.renderer.render(partial: 'messages/message', locals: { message: message })
  end
end
