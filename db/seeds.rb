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
	User.create(:email=>Faker::Internet.email,:password=>"1234",:firstname=>Faker::Name.first_name,:lastname=>Faker::Name.last_name,:avatars=>[["http://loremflickr.com/64/64/paris,girl/all?random=1"],["http://loremflickr.com/64/64/italy,man/all?random=2"],["http://loremflickr.com/64/64/rio,girl/all?random=3"],["http://loremflickr.com/320/240/ny,boy/all?random=4"],["http://loremflickr.com/64/64/manga/all?random=5"],["http://loremflickr.com/64/64/robot/all?random=6"],["http://loremflickr.com/64/64/cat/all?random=7"],["http://loremflickr.com/64/64/dog/all?random=8"]].sample)
end

# LISTINGS
50.times do 
	Listing.create(:title=>Faker::Space.star,:location=>Faker::StarWars.planet,:description=>Faker::Lorem.sentence,:price_per_night=>rand(1..10000),:photo=>Faker::Placeholdit.image,:nb_rooms=>rand(1..10),:isSmoker=>[true,false].sample,:isPetFriendly=>[true,false].sample,:hasLatecheckout=>[true,false].sample,:hasKitchen=>[true,false].sample,	:hasWifi=>[true,false].sample,:hasSwimmingPool=>[true,false].sample,:user_id=>rand(1..10))
end