class Conversation < ApplicationRecord

  has_many :messages
  belongs_to :sender, foreign_key: :sender_id, class_name: 'User'
  belongs_to :recipient, foreign_key: :recipient_id, class_name: 'User'

    def self.get(sender, recipient)
        conversation = Conversation.where("(sender_id = ? AND recipient_id = ?) OR (sender_id = ? AND recipient_id = ?)", sender.id, recipient.id, recipient.id, sender.id).first
        conversation ||= Conversation.create(sender: sender, recipient: recipient)
      end
end
