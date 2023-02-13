class Conversation < ApplicationRecord
    def self.get(sender, recipient)
        conversation = Conversation.where("(sender_id = ? AND recipient_id = ?) OR (sender_id = ? AND recipient_id = ?)", sender.id, recipient.id, recipient.id, sender.id).first
        conversation ||= Conversation.create(sender: sender, recipient: recipient)
      end
end
