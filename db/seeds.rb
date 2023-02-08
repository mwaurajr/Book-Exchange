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
    profile_pic: "https://www.shutterstock.com/image-photo/barcelona-feb-15-lionel-messi-600w-1658517079.jpg"
)

user2 = User.create!(
    name: "Mojino",
    age: 24,
     email: "mojino40.m@gmail.com",
     password: "123456",
     phoneNumber: 9876543210,
    address: "1201 Githurai",
     bio: "odjiehdioehcihcowhdowehdowhdioehdeiocdincodcohvruvrougvuoehouhuoweduhwohuowhdohcedcbnjkkskjahodhedheheoheofhofhwofhowf",
     profile_pic: "https://www.shutterstock.com/image-photo/barcelona-feb-15-lionel-messi-600w-1658517079.jpg"
    
  
   
)

puts "Creating books..."
book1 = Book.create(
    title: "The river and the source",
    description: Faker::Lorem.characters,
    condition: "New",
    user_id: 1,
    author: "Robert Ouko",
    published: 2010
)


puts "Creating BookExchanges..."


 BookExchange.create(sender_id: 1, receiver_id: 2, book_id: 3)


puts "Creating Reviews..."

Review.create(user_id: 1, book_exchange_id: rand(1..BookExchange.all.size), rating: 4, content: "This book exchange was great!")



puts "Done seeding data."