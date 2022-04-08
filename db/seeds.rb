# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

image = 'https://images.unsplash.com/photo-1648974299612-679d6fb46816?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80'
user1 = User.create!( name: 'Tom', photo: image, bio:'Programer', posts_counter: 0, email: 'tom@example.com', password: 'tom123')
user2 = User.create!( name: 'Ed', photo: image, bio: 'Artist', posts_counter: 0, email: 'ed@example.com', password: 'ed1234' )
user3 = User.create!( name: 'King', photo: image, bio: 'Dancer', posts_counter: 0, email: 'king@example.com', password: 'king123' )
user4 = User.create!( name: 'David', photo: image, bio: 'Painter', posts_counter: 0, email: 'david@example.com', password: 'david123')

post1 = user1.posts.create!( title: 'programmer', text: 'Iam Programmer I have life', likes_counter: 0, comments_counter: 0)
post2 = user2.posts.create!( title: 'skyDiving!!', text: 'Going sky diving this weekend wanna come?', likes_counter: 0, comments_counter: 0) 