Given /the following attending events exist/ do |attending_events_table|
  attending_events_table.hashes.each do |attending_event|
    # each returned element will be a hash whose key is the table header.
    # you should arrange to add that game to the database here.
    
    FavoriteEvent.create!(attending_event)
  end
end

Then /(.*) seed attending events should exist/ do | n_seeds |
  FavoriteEvent.count.should be n_seeds.to_i
end