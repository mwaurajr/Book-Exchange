class Book < ApplicationRecord

    belongs_to :user
    validates :title, :author,  presence: true

    has_many :book_exchanges
    has_many :reviews, dependent: :destroy

    def create_notification
        Notification.create(user_id: user_id, message: "A new book has been posted!", url: "/books/#{id}", read: false)
      end
    
    
   
     
    
     
end
