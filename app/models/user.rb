class User < ApplicationRecord
    has_secure_password
    has_many :books

    # attribute :phoneNumber, :integer, limit: 

    validates :name, :address, presence: true
   
    validates :email, 
    uniqueness: true, 
    length: { in: 3..255 }, 
    format: { with: URI::MailTo::EMAIL_REGEXP }


  validates :phoneNumber,
    # format: { with: /\A\d{10}\z/ },
    length: { maximum: 10 },
    allow_nil: false

    has_many :sent_book_exchanges, foreign_key: 'sender_id', class_name: 'BookExchange'
    has_many :received_book_exchanges, foreign_key: 'receiver_id', class_name: 'BookExchange'
    
end
