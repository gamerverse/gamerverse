Given /the following favorite games exist/ do |favorite_games_table|
  favorite_games_table.hashes.each do |favorite_game|
    # each returned element will be a hash whose key is the table header.
    # you should arrange to add that game to the database here.
    
    FavoriteGame.create!(favorite_game)
  end
end

Then /(.*) seed favorite games should exist/ do | n_seeds |
  FavoriteGame.count.should be n_seeds.to_i
end