# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

#-------------------GAMES-----------------

Game.create(title: "League of Legends", coverart: "covers/league_of_legends.jpg", favorite_count: 0, genre: "MOBA")
Game.create(title: "Overwatch", coverart: "covers/overwatch.jpg", favorite_count: 0, genre: "First-Person Shooter")
Game.create(title: "Super Smash Bros. Melee", coverart: "covers/super_smash_bros_melee.jpg", favorite_count: 0, genre: "Fighting")
Game.create(title: "Fortnite", coverart: "covers/fortnite.jpg", favorite_count: 0, genre: "Battle Royale")
Game.create(title: "Hearthstone", coverart: "covers/hearthstone.jpg", favorite_count: 0, genre: "Cards")
Game.create(title: "Mario Kart 8", coverart: "covers/mario_kart_8.jpg", favorite_count: 0, genre: "Racing")
Game.create(title: "Starcraft 2", coverart: "covers/starcraft_2.jpg", favorite_count: 0, genre: "Real-Time Strategy")
Game.create(title: "Super Mario 64", coverart: "covers/super_mario_64.jpg", favorite_count: 0, genre: "Platformer")
Game.create(title: "Street Fighter V", coverart: "covers/street_fighter_v.jpg", favorite_count: 0, genre: "Fighting")
Game.create(title: "The Legend of Zelda: Ocarina of Time", coverart: "covers/zelda_ocarina_of_time.jpg", favorite_count: 0, genre: "Action-Adventure")
Game.create(title: "Dark Souls", coverart: "covers/dark_souls.jpg", favorite_count: 0, genre: "Action-Adventure")
Game.create(title: "DOOM", coverart: "covers/doom.jpg", favorite_count: 0, genre: "First-Person Shooter")
Game.create(title: "Grand Theft Auto V", coverart: "covers/grand_theft_auto_v.jpg", favorite_count: 0, genre: "Action-Adventure")
Game.create(title: "Left 4 Dead 2", coverart: "covers/left_4_dead_2.jpg", favorite_count: 0, genre: "First-Person Shooter")
Game.create(title: "Minecraft", coverart: "covers/minecraft.jpg", favorite_count: 0, genre: "Sandbox")
Game.create(title: "Persona 5", coverart: "covers/persona_5.jpg", favorite_count: 0, genre: "RPG")
Game.create(title: "Portal 2", coverart: "covers/portal_2.jpg", favorite_count: 0, genre: "Puzzle")
Game.create(title: "Rocket League", coverart: "covers/rocket_league.jpg", favorite_count: 0, genre: "Sports")
Game.create(title: "Super Metroid", coverart: "covers/super_metroid.jpg", favorite_count: 0, genre: "Metroidvania")
Game.create(title: "Tekken 7", coverart: "covers/tekken_7.jpg", favorite_count: 0, genre: "Fighting")
Game.create(title: "Civilization V", coverart: "covers/civilization_v.jpg", favorite_count: 0, genre: "Turn-Based Strategy")
Game.create(title: "Cuphead", coverart: "covers/cuphead.jpg", favorite_count: 0, genre: "Platformer")
Game.create(title: "Dota 2", coverart: "covers/dota_2.jpg", favorite_count: 0, genre: "MOBA")
Game.create(title: "FIFA 18", coverart: "covers/fifa_18.jpg", favorite_count: 0, genre: "Sports")
Game.create(title: "Final Fantasy VII", coverart: "covers/final_fantasy_vii.jpg", favorite_count: 0, genre: "RPG")
Game.create(title: "Horizon Zero Dawn", coverart: "covers/horizon_zero_dawn.jpg", favorite_count: 0, genre: "Action-Adventure")
Game.create(title: "PlayerUnknown's Battlegrounds", coverart: "covers/playerunknowns_battlegrounds.jpg", favorite_count: 0, genre: "Battle Royale")
Game.create(title: "Pokemon Ultra Sun/Ultra Moon", coverart: "covers/pokemon_ultra_sun_ultra_moon.jpg", favorite_count: 0, genre: "RPG")
Game.create(title: "Super Smash Bros. For Wii U", coverart: "covers/super_smash_bros_for_wii_u.jpg", favorite_count: 0, genre: "Fighting")
Game.create(title: "Terraria", coverart: "covers/terraria.jpg", favorite_count: 0, genre: "Sandbox")
Game.create(title: "World of Warcraft", coverart: "covers/world_of_warcraft.jpg", favorite_count: 0, genre: "MMORPG")
Game.create(title: "Super Mario Sunshine", coverart: "covers/super_mario_sunshine.jpg", favorite_count: 0, genre: "Platformer")
Game.create(title: "Super Mario Odyssey", coverart: "covers/super_mario_odyssey.jpg", favorite_count: 0, genre: "Platformer")

#-------------------EVENTS-------------------

Event.create(title: "Smash LAN Party", location: "Smashville",
description: "LAN party for the best Smash players!", date: DateTime.new(2018,4,8,12), attending_count: 0)

Event.create(title: "Mario Odyssey Speedrun Marathon", location: "New Donk City",
description: "goin fast", date: DateTime.new(2009,9,1,17), attending_count: 0)

Event.create(title: "League 1v1", location: "Summoner's Rift", 
description: "First Blood or First Tower Wins", date: DateTime.new(2015,2,22,06), attending_count: 0)

Event.create(title: "League 2v2", location: "Howling Abyss", 
description: "First 2 Bloods Wins", date: DateTime.new(2015,2,23,06), attending_count: 0)

Event.create(title: "League 3v3", location: "Twisted Treeline", 
description: "First 3 Bloods Wins", date: DateTime.new(2015,2,24,06), attending_count: 0)

#-------------------USERS-------------------

User.create(username: "username", password: "password", password_confirmation: "password",
            email: "username@gmail.com", zipcode: 11111)