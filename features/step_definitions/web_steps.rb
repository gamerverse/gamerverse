require 'uri'
require 'cgi'

module WithinHelpers
  def with_scope(locator)
    locator ? within(*selector_for(locator)) { yield } : yield
  end
end
World(WithinHelpers)

#---------------------------------------

Given /^(?:|I )am on the (.+) page$/ do |page_name|
  page_name.downcase!
  
  if page_name.match(/home/)
    visit(homepage_index_path)
  elsif page_name.match(/register/)
    visit(register_path)
  else
    visit(page_name)
  end
end

Given /^(?:|I )am logged (.+)/ do |status|
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

Then /^(?:|I )click the (.+) button/ do |button_name|
  click_button(button_name)
end

Then /^(?:|I )click the (.+) link on the navigation bar/ do |link_name|
  within("nav#navbar") do
    click_link(link_name)
  end
end

Then /^(?:|I )should be redirected to the (.+) page/ do |page_name|
  page_name.downcase!
  
  if(page_name.match(/home/))
    expect(page.current_path).to eq "/"
  elsif(page_name.match(/register/))
    expect(page.current_path).to eq register_path
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

Then /^(?:|I )should see it populated with (.+) games$/ do |num_games|
  expect(page).to have_selector('.game-list-item', count: num_games)
end

Then /^(?:|I )should see it populated with (.+) events/ do |num_events|
  expect(page).to have_selector('.event-list-item', count: num_events)
end

Then /^(?:|I )set (.+) to (.+)/ do |field, value|
  fill_in(field, :with => value)
end

#And I should see an error message for Username
Then /^(?:|I )should see an error message for (.+)/ do |field|
  #expect(flash[:warning]).to match(/#{field}/i)
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