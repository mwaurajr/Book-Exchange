class User < ApplicationRecord
    has_secure_password
    has_many :books
    has_one_attached :profile_pic

    # attribute :phoneNumber, :integer, limit: 

    validates :name, :address, presence: true
   
    validates :email, 
    uniqueness: true, 
    length: { in: 3..255 }, 
    format: { with: URI::MailTo::EMAIL_REGEXP }


  validates :phoneNumber,
    format: { with: /\A\d{10}\z/ },
    length: { maximum: 10 },
    allow_nil: false

    attribute :phoneNumber, :integer, limit: 16

    has_many :sent_book_exchanges, foreign_key: 'sender_id', class_name: 'BookExchange'
    has_many :received_book_exchanges, foreign_key: 'receiver_id', class_name: 'BookExchange'
    has_many :reviews, dependent: :destroy

    has_many :sent_conversations, class_name: 'Conversation', foreign_key: 'sender_id'
    has_many :received_conversations, class_name: 'Conversation', foreign_key: 'recipient_id'
    has_many :messages
    
end
