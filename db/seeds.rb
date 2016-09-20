# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

require 'faker'


# USERS
10.times do 
	User.create(:email=>Faker::Internet.email,:password=>Faker::Internet.password(8),:firstname=>Faker::Name.first_name,:lastname=>Faker::Name.last_name)
end

# LISTINGS
50.times do 
	Listing.create(:title=>Faker::Space.star,:location=>Faker::StarWars.planet,:description=>Faker::Lorem.sentence,:price_per_night=>rand(1..10000),:photo=>Faker::Placeholdit.image,:nb_rooms=>rand(1..10),:isSmoker=>[true,false].sample,:isPetFriendly=>[true,false].sample,:hasLatecheckout=>[true,false].sample,:hasKitchen=>[true,false].sample,	:hasWifi=>[true,false].sample,:hasSwimmingPool=>[true,false].sample,:user_id=>rand(1..10))
end