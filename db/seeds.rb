require 'random_data'
require 'faker'



5.times do
  User.create!(
  email:    Faker::Internet.email,
  password: RandomData.random_sentence
  )
end

# admin
1.times do
  User.create!(
  email:     'zander.pritchard@gmail.com',
  password:  'helloworld',
  role:       2
  )
end

# standard
1.times do
  User.create!(
  email:    Faker::Internet.email,
  password: 'helloworld'
  )
end
users = User.all

50.times do
  Wiki.create!(
    title:  RandomData.random_sentence,
    body:   RandomData.random_paragraph,
    user: User.new
  )
end
wikis = Wiki.all


puts "Seed finished"
puts "#{User.count} users created"
puts "#{Wiki.count} wikis created"
