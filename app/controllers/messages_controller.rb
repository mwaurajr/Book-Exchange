class MessagesController < ApplicationController

    def create
        recipient = User.find(params[:recipient_id])
        conversation = Conversation.get(current_user, recipient)
        message = conversation.messages.new(message_params)
        message.user = current_user
        message.save!
        head :ok
      end
    
      def index
        recipient = User.find(params[:recipient_id])
        conversation = Conversation.get(current_user, recipient)
        messages = conversation.messages
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
