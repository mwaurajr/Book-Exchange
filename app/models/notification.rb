class Notification < ApplicationRecord
    def create_notification
        Notification.create(user_id: user_id, message: "A new book has been posted!", url: "/books/#{id}", read: false)
      end
end
