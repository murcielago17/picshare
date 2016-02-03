# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)



joe = User.create!({name: "Camera Joe", email:"Joe@email.com", password:"111111"})
doe = User.create!({name: "Lights Doe", email:"Doe@email.com", password:"111111"})

Item.create!({name: "Nikon D7000", description: "Camera", user: joe})
Item.create!({name: "Nikkor 35mm", description: "Nikon lens", user: doe})