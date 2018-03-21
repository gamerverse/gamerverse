Given /the following games exist/ do |games_table|
  games_table.hashes.each do |game|
    # each returned element will be a hash whose key is the table header.
    # you should arrange to add that game to the database here.
    
    Game.create!(game)
  end
end

Then /(.*) seed games should exist/ do | n_seeds |
  Game.count.should be n_seeds.to_i
end