class Book < ApplicationRecord

    belongs_to :user
    validates :title, :author,  presence: true

    has_many :book_exchanges
    has_many :reviews, dependent: :destroy
end
