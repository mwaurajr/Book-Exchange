class User < ApplicationRecord
    has_secure_password
    has_many :books

    attribute :phoneNumber, :integer, limit: 13
end
