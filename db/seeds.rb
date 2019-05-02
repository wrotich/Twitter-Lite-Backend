# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create(name: 'Max', email: 'maxwell.githinji@andela.com', password: "121321")
# binding.pry
User.first.tweets.create(body: 'hi am max')
User.first.tweets.create(body: 'out')
