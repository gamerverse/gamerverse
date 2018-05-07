require 'uri'
require 'cgi'

module WithinHelpers
  def with_scope(locator)
    locator ? within(*selector_for(locator)) { yield } : yield
  end
end
World(WithinHelpers)

#---------------------------------------

Given /(?:|I )am on the (.+) page$/ do |page_name|
  page_name.downcase!
  
  if page_name.match(/home/)
    visit(homepage_index_path)
  elsif page_name.match(/register/)
    visit(register_path)
  elsif page_name.match(/edit profile/)
    visit(profile_edit_path)
  elsif page_name.match(/profile/) 
    visit(profile_path)
  elsif page_name.match(/events/) 
    visit(events_path)
  elsif page_name.match(/create event/)
    visit(events_create_path)
  elsif page_name.match(/games/) 
    visit(games_path)
  else
    visit(page_name)
  end
end

Given /^(?:|I )am logged (.+)$/ do |status|
  # Log the user in before the test continues
  if status.match(/in/)
    visit(login_path)
    
    within("#login-users") do
      fill_in 'Username', :with => 'test1'
      fill_in 'Password', :with => 'testing123'
    end
    
    click_button 'Submit'
    visit(homepage_index_path)
  # If logged out, just visit the home page
  else
    visit(homepage_index_path)
  end
end

When /^(?:|I )click the (.+) button for (.+)$/ do |button_name, section|
  if(button_name == "Favorite")
    click_link("❤️")
  elsif(button_name == "Unfavorite")
    click_link("❌️")
  elsif(button_name == "Attend")
    click_link("Attend")
  elsif(button_name == "Unattend")
    click_link("Unattend")
  end
  
  
end

Then /^(?:|I )click the (.+) button$/ do |button_name|
  click_button(button_name)
end

Then /^(?:|I )click the (.+) link$/ do |link_name|
  click_link(link_name)
end

Then /^(?:|I )click the (.+) link on the navigation bar$/ do |link_name|
  within("nav#navbar") do
    click_link(link_name)
  end
end

Then /^(?:|I )should be redirected to the (.+) page$/ do |page_name|
  page_name.downcase!

  if(page_name.match(/home/))
    expect(page.current_path).to eq "/"
  elsif(page_name.match(/register/))
    expect(page.current_path).to eq register_path
  elsif(page_name.match(/edit profile/))
    expect(page.current_path).to eq profile_edit_path
  elsif(page_name.match(/create event/))
    expect(page.current_path).to eq events_create_path
  elsif(page_name.match(/games/))
    expect(page.current_path).to eq games_path
  else
    expect(page.current_path).to eq send("#{page_name}_path")
  end
end

Then /^(?:|I )should see a (.+) section$/ do |section_name|
  expect(page.find('h1', text: section_name))
end

Then /^(?:|I )should not see a (.+) link on the navigation bar$/ do |link_name|
  expect(page).not_to have_selector('.nav-list-item', text: link_name)
end

Then /^(?:|I )should see a (.+) link on the navigation bar$/ do |link_name|
  expect(page).to have_selector('.nav-list-item', text: link_name)
end

Then /^(?:|I )(.+) see a (.+) link$/ do |should, link_name|
  link = 'failure'
  link_name.downcase!
  if(link_name.match(/edit profile/))
    link = '/profile/edit'
  elsif(link_name.match(/create event/))
    link = '/events/create'
  end
  
  if(should.match(/should not/))
    expect(page).not_to have_link(href: link)
  elsif(should.match(/should/))
    expect(page).to have_link(href: link)
  end
end

Then /^(?:|I )should see it populated with (.+) (.+)/ do |num, type|
  if(type == "games")
    expect(page).to have_selector('.game-list-item', count: num)
  elsif(type == "events")
    expect(page).to have_selector('.event-list-item', count: num)
  end
end

Then /^(?:|I )set (.+) to (.+)$/ do |field, value|
  if(!value.match(/nothing/))
    fill_in(field, :with => value)
  end
end

#And I should see an error message for Username
Then /^(?:|I )should see an error message for (.+)$/ do |field|
  #expect(flash[:warning]).to match(/#{field}/i)
  if(field.match(/Zip Code/))
    field.gsub!(' ','')
  end
  expect(page).to have_selector('div#errors', text: /#{field}/i)
end

Then /^(?:|I )should be logged (.+)$/ do |status|
  #If logged in, expect logout link
  if status.match(/in/)
    expect(page).to have_selector('.nav-list-item', text: 'Logout')
  #if logged out, expect login link
  else 
    expect(page).to have_selector('.nav-list-item', text: 'Login')
  end
end

Then /^(?:I )leave (.+) empty$/ do |field|
  fill_in(field, :with => "")
end

Then /^(?:I )should see (.+) populated with the text (.+)$/ do |field, data|
  field.downcase!
  
  if(field.match(/zip code/))
    field = "zip-code"
  end
  
  within("#user-info") do
    expect(page).to have_selector("##{field}", text: data)
  end
end

And /^(?: I)(.+) see (.+) in the (.+) section$/ do |should, data, section|
  if(should.match(/should not/))
    expect(page).not_to have_selector("#{section}", text: data)
  elsif(should.match(/should/))
    expect(page).to have_selector("#{section}", text: data)
  end
end