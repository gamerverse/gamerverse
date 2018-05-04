# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

#-------------------GAMES-----------------

Game.create(title: "League of Legends", coverart: "covers/league_of_legends.jpg")
Game.create(title: "Overwatch", coverart: "covers/overwatch.jpg")
Game.create(title: "Super Smash Bros. Melee", coverart: "covers/super_smash_bros_melee.jpg")
Game.create(title: "Fortnite", coverart: "covers/fortnite.jpg")
Game.create(title: "Hearthstone", coverart: "covers/hearthstone.jpg")
Game.create(title: "Mario Kart 8", coverart: "covers/mario_kart_8.jpg")
Game.create(title: "Starcraft 2", coverart: "covers/starcraft_2.jpg")
Game.create(title: "Super Mario 64", coverart: "covers/super_mario_64.jpg")
Game.create(title: "Street Fighter V", coverart: "covers/street_fighter_v.jpg")
Game.create(title: "The Legend of Zelda: Ocarina of Time", coverart: "covers/zelda_ocarina_of_time.jpg")

#-------------------EVENTS-------------------

Event.create(title: "Smash LAN Party", location: "Smashville",
description: "LAN party for the best Smash players!", date: DateTime.new(2018,4,8,12))

Event.create(title: "Mario Odyssey Speedrun Marathon", location: "New Donk City",
description: "goin fast", date: DateTime.new(2009,9,1,17))

Event.create(title: "League 1v1", location: "Summoner's Rift", 
description: "First Blood or First Tower Wins", date: DateTime.new(2015,2,22,06))

Event.create(title: "League 2v2", location: "Howling Abyss", 
description: "First 2 Bloods Wins", date: DateTime.new(2015,2,23,06))

Event.create(title: "League 3v3", location: "Twisted Treeline", 
description: "First 3 Bloods Wins", date: DateTime.new(2015,2,24,06))

#-------------------USERS-------------------

User.create(username: "username", password: "password", password_confirmation: "password",
            email: "username@gmail.com", zipcode: 11111)
            
#-------------------FAVORITE GAMES-------------------
FavoriteGame.create(user_id: 1, game_id: 1)