# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

puts "Destroying tables..."

User.destroy_all
Book.destroy_all
Review.destroy_all


puts "Resetting primary keys..."

ApplicationRecord.connection.reset_pk_sequence!('users')
ApplicationRecord.connection.reset_pk_sequence!('books')
ApplicationRecord.connection.reset_pk_sequence!('reviews')


puts "Creating users..."
user1 = User.create!(
    name: "Wung wang",
    email: "wung.wang@gmail.com",
    age: 22,
    phoneNumber: 1234567890,
    password: "12345",
    address: "1203Strt",
    bio: Faker::Lorem.paragraph,
    # profile_pic: "https://www.shutterstock.com/image-photo/barcelona-feb-15-lionel-messi-600w-1658517079.jpg"
)

user2 = User.create!(
    name: "Mwas Kante",
    email: "mwas@gmail.com",
    age: 23,
    phoneNumber: 1234567890,
    password: "12345",
    address: "1203Strt",
    bio: Faker::Lorem.paragraph,
    # profile_pic: "https://www.shutterstock.com/image-photo/barcelona-feb-15-lionel-messi-600w-1658517079.jpg"
)

user3 = User.create!(
    name: "Wang JI",
    email: "wung.JI@gmail.com",
    age: 24,
    phoneNumber: 1234567890,
    password: "12345",
    address: "1203Strt",
    bio: Faker::Lorem.paragraph,
    # profile_pic: "https://www.shutterstock.com/image-photo/barcelona-feb-15-lionel-messi-600w-1658517079.jpg"
)

user4 = User.create!(
    name: "Wung wangji",
    email: "wung.wangji@gmail.com",
    age: 25,
    phoneNumber: 1234567890,
    password: "12345",
    address: "1203Strt",
    bio: Faker::Lorem.paragraph,
    # profile_pic: "https://www.shutterstock.com/image-photo/barcelona-feb-15-lionel-messi-600w-1658517079.jpg"
)


user5 = User.create!(
    name: "Wung ",
    email: "wung.@gmail.com",
    age: 26,
    phoneNumber: 1234567890,
    password: "12345",
    address: "1203Strt",
    bio: Faker::Lorem.paragraph,
    # profile_pic: "https://www.shutterstock.com/image-photo/barcelona-feb-15-lionel-messi-600w-1658517079.jpg"
)


user6 = User.create!(
    name: "Mojino",
    age: 27,
     email: "mojino40.m@gmail.com",
     password: "123456",
     phoneNumber: 9876543210,
    address: "1201 Githurai",
     bio: "odjiehdioehcihcowhdowehdowhdioehdeiocdincodcohvruvrougvuoehouhuoweduhwohuowhdohcedcbnjkkskjahodhedheheoheofhofhwofhowf",
    #  profile_pic: "https://www.shutterstock.com/image-photo/barcelona-feb-15-lionel-messi-600w-1658517079.jpg"
    
  
   
)

puts "Creating books..."
book1 = Book.create!(
    description: Faker::Lorem.characters,
    # condition: "New",
    user_id: 1,
    title: "Book of Knowledge",
    author: "Robert Ouko",
    # published: 2010
)
Book.create!(
    description: Faker::Lorem.characters,
    # condition: "New",
    user_id: 1,
    title: "Blossoms of the savannah",
    author: "Robert Ouko",
    # published: 2010
)
Book.create!(
    description: Faker::Lorem.characters,
    # condition: "New",
    user_id: 1,
    title: "Chozi la Heri",
    author: "Robert Ouko",
    # published: 2010
)
Book.create!(
    description: Faker::Lorem.characters,
    # condition: "New",
    user_id: 1,
    title: "The pearl",
    author: "Robert Ouko",
    # published: 2010
)
Book.create!(
    description: Faker::Lorem.characters,
    # condition: "New",
    user_id: 1,
    title: "Gulible",
    author: "Robert Ouko",
    # published: 2010
)
Book.create!(
    description: Faker::Lorem.characters,
    # condition: "New",
    user_id: 1,
    title: "Kidagaa Kimemwozea",
    author: "Robert Ouko",
    # published: 2010
)
Book.create!(
    description: Faker::Lorem.characters,
    # condition: "New",
    user_id: 1,
    title: "Riverand the source",
    author: "Robert Ouko",
    # published: 2010
)


puts "Creating BookExchanges..."


 BookExchange.create!(sender_id: 1, receiver_id: 2, book_id: 1)


puts "Creating Reviews..."

Review.create!(user_id: 1, rating: 4, content: "This book exchange was great!", book_id: 1)
Review.create!(user_id: 3, rating: 4, content: "This book exchange was great!", book_id: 2)
Review.create!(user_id: 2, rating: 4, content: "This book exchange was great!", book_id: 3)
Review.create!(user_id: 2, rating: 4, content: "This book exchange was great!", book_id: 5)
Review.create!(user_id: 3, rating: 4, content: "This book exchange was great!", book_id: 4)
Review.create!(user_id: 4, rating: 4, content: "This book exchange was great!", book_id: 3)



puts "Done seeding data."