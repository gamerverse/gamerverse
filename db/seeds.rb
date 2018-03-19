# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Game.create(title: "League of Legends", coverart: "/app/assets/images/covers/league_of_legends.jpg")
Game.create(title: "Overwatch", coverart: "/app/assets/images/covers/overwatch.jpg")
Game.create(title: "Super Smash Bros. Melee", coverart: "/app/assets/images/covers/super_smash_bros_melee.jpg")