class User < ApplicationRecord
    has_secure_password
    has_many :books
    has_one_attached :profile_pic

    # attribute :phoneNumber, :integer, limit: 

    validates :name, presence: true
   
    validates :email, 
    uniqueness: true, 
    length: { in: 3..255 }, 
    format: { with: URI::MailTo::EMAIL_REGEXP }


    # validates :phoneNumber, presence: true, format: {
    #   with: /\A\+?\d{8,15}\z/,
    #   message: "must be a valid phone number"
    # }
    

    validate :validate_age

    attribute :phoneNumber, :integer, limit: 16

    has_many :sent_book_exchanges, foreign_key: 'sender_id', class_name: 'BookExchange'
    has_many :received_book_exchanges, foreign_key: 'receiver_id', class_name: 'BookExchange'
    has_many :reviews, dependent: :destroy

    has_many :sent_conversations, class_name: 'Conversation', foreign_key: 'sender_id'
    has_many :received_conversations, class_name: 'Conversation', foreign_key: 'recipient_id'
    has_many :messages

     has_many :notifications




     def validate_age
      if age.present? && age.to_i.years.ago > Date.current
        errors.add(:age, "You must be 13 or older to use Bookswap. Other people won't see your birthday.")
      end
    end
    
    
    
    
    
    
end
