# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
puts 'deleting'
Art.destroy_all
User.destroy_all


puts 'creating 1 user'

user1 = User.create!(username: 'Jeremias', first_name: 'Jeremias', last_name: 'coco', address: 'under the bridge', phone_number: '555999blablabla', details: 'I LOve art', email: 'a@gmail.com', password:'123456')
user2 = User.create!(username: 'Jacob', first_name: 'Jacob', last_name: 'coco', address: 'under the bridge', phone_number: '555999blablabla', details: 'I LOve art', email: 'b@gmail.com', password:'123456')

puts 'creating 100 arts'
100.times do
  style = ['renessaince', 'modern', 'art deco', 'classic', 'new age', 'middle eastern', 'romantism', 'comtemporary'].sample
  type = ['sculpture', 'painting', 'tapestry', 'relics'].sample
  price = rand(1000..10000000)
  art = Art.new(name: Faker::FunnyName.three_word_name, style: style, era: type, artist: Faker::Artist.name, price: price, description: Faker::IndustrySegments.super_sector, address: Faker::Address.street_address, available: false)
  art.user = user1
  art.save
end

puts 'done 😄'
