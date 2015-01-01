# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
require 'faker'

User.destroy_all
Oneline.destroy_all

(1..10).each do |n|
  User.create!(
    username: "test_user#{n}",
    email: "test_user#{n}@example.com",
    password: 'pass1234',
    password_confirmation: 'pass1234'
  )
end

puts "created #{User.count} users."

15.times do
  Oneline.create!(
    subject: Faker::Lorem.word,
    definition: Faker::Lorem.sentence,
    author_id: (1..10).to_a.sample
  )
end

puts "created #{Oneline.count} onelines."
