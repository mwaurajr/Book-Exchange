class ReviewSerializer < ActiveModel::Serializer
  attributes :id, :content, :rating
  has_one :user
  has_one :book
end
