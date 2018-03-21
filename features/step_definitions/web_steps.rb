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
  else
    visit(page_name)
  end
end

Then /^(?:|I )should see a (.+) section$/ do |section_name|
  expect(page.find('h1', text: section_name))
end
  
  
And /^(?:|I )should see it populated with (.+) games$/ do |num_games|
  expect(page).to have_selector('.featured-game', count: num_games)
end