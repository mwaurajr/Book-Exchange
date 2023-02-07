class User < ApplicationRecord
    has_secure_password
    has_many :books

    attribute :phoneNumber, :integer, limit: 13

    validates :name, :address, presence: true
   
    validates :email, 
    uniqueness: true, 
    length: { in: 3..255 }, 
    format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :phone_number,
    format: { with: /\A\d{10}\z/ },
    length: { maximum: 10 },
    allow_nil: false
    
end
