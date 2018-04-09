Given /the following events exist/ do |events_table|
  events_table.hashes.each do |event|
    # each returned element will be a hash whose key is the table header.
    # you should arrange to add that game to the database here.
    
    Event.create!(event)
  end
end

Then /(.*) seed events should exist/ do | n_seeds |
  Event.count.should be n_seeds.to_i
end