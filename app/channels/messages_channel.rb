class MessagesChannel < ApplicationCable::Channel
  def subscribed
    conversation = Conversation.find(params[:conversation_id])
    stream_for conversation
  end

  def receive(data)
    message = current_user.messages.build(data)
    message.conversation_id = params[:conversation_id]
    message.save!
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  private

  def authenticate_user!
    token, _options = token_and_options(request)
    user_id = AuthenticationTokenService.decode(token)
    @current_user = User.find(user_id)
  rescue ActiveRecord::RecordNotFound, JWT::DecodeError
    reject_unauthorized_connection
  end
end
