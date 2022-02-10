# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

email = "test@example.com"
password = "password"
nickname = "AJ"

ActiveRecord::Base.connection.execute("TRUNCATE TABLE users RESTART IDENTITY CASCADE")

user = User.create!(
  email: Faker::Internet.email,
  password: "Faker::Internet.password(min_length: 8, max_length: 20, mix_case: true)",
  nickname: Faker::Name.initials
)

5.times do
  buddy = user.buddies.build(
      first_name: Faker::Name.first_name,
      last_name: Faker::Name.last_name,
      email: Faker::Internet.email,
      phone: Faker::PhoneNumber.cell_phone,
      age: rand(0..200),
      user_id: user.id,
    )

    buddy.save!
  end

  user1 = User.create!(email: email, password: password, nickname: nickname)

  3.times do
    buddy1 = user1.buddies.build(
      first_name: Faker::Name.first_name,
      last_name: Faker::Name.last_name,
      email: Faker::Internet.email,
      phone: Faker::PhoneNumber.cell_phone,
      age: rand(0..200),
      user_id: user1.id,
    )

  buddy1.save!
end

puts "Initial data inserted successfully!"
