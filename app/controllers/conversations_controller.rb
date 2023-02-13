class ConversationsController < ApplicationController

    def destroy
        conversation = Conversation.find(params[:id])
        conversation.messages.destroy_all
        conversation.destroy
        head :ok
    end
end
