Given /the following users exist/ do |users|
  users.hashes.each do |user|
    # each returned element will be a hash whose key is the table header.
    # you should arrange to add that game to the database here.
    
    User.create!(user)
  end
end

Then /(.*) seed users should exist/ do | n_seeds |
  User.count.should be n_seeds.to_i
end