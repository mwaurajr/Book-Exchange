class UserSerializer < ActiveModel::Serializer
  attributes :id, :name, :age, :email, :password, :phoneNumber, :address, :bio, :profile_pic
end
