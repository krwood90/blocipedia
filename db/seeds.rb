# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

 admin = User.create!(
   username: 'Admin1',
   email:    'admin@example.com',
   password: 'helloworld',
   role:     'admin'
 )
 
  prem = User.create!(
   username: 'Prem1',
   email:    'prem@example.com',
   password: 'premworld',
   role:     'premium'
 )

5.times do
 User.create!(
  username: Faker::Name.name,
  email: Faker::Internet.unique.email,
  password: Faker::Internet.unique.password
  )
 end
 users = User.all
 
 15.times do
   wiki = Wiki.create!(
     user: users.sample,
     title:  Faker::Name.title,
     body:   Faker::Lorem.paragraph(2),
     private: false,
   )
   wiki.update_attribute(:created_at, rand(10.minutes .. 1.year).ago)
 end
 wiki = Wiki.all
 
 6.times do
   wiki = Wiki.create!(
     user: users.sample,
     title:  Faker::Name.title,
     body:   Faker::Lorem.paragraph(2),
     private: true,
   )
   wiki.update_attribute(:created_at, rand(10.minutes .. 1.year).ago)
 end
 wiki = Wiki.all

puts "#{User.count} users created!"
puts "#{Wiki.count} wikis created!"