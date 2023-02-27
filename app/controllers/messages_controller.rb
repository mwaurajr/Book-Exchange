class MessagesController < ApplicationController
  before_action :authenticate_user!

  def create
    conversation = Conversation.find_or_create_by(
      sender_id: current_user.id,
      recipient_id: params[:recipient_id]
    )
    message = conversation.messages.build(message_params.merge(user_id: current_user.id))
    if message.save
      ActionCable.server.broadcast 'ChatChannel', message: message.to_json
      render json: message, status: :created
    else
      render json: message.errors, status: :unprocessable_entity
    end
  end

  def index
    recipient = User.find(params[:recipient_id])
    conversation = Conversation.find_by(sender: current_user, recipient: recipient) ||
      Conversation.find_by(sender: recipient, recipient: current_user)
    messages = conversation.messages.order(created_at: :desc)
    render json: messages
  end

  def destroy
    message = Message.find(params[:id])
    message.destroy
    head :ok
  end

  private

  def message_params
    params.require(:message).permit(:content)
  end
end
