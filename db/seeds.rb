# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.destroy_all
10.times do |index|
  User.create( email: Faker::Internet.unique.free_email,
               user_name: Faker::Internet.user_name(%w(. _ -)),
               password: 'password',
               password_confirmation: 'password',
               avatar: Faker::Avatar.unique.image,
               bio: Faker::Hipster.unique.sentence
              )
end
