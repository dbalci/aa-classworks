# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Post.destroy_all


#Posts

first = Post.create!(title: 'Hello', body: 'first post ever!')
second = Post.create!(title: "Whats' up", body: 'every thing looks good')
