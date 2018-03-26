Feature: Navigation Bar v1 (Home and Games)
 
  As a user,
  I want to see a navigation bar on every page,
  So that I can navigate through the website
  
Scenario: Home to Games navigation
  Given I am on the Home page
  Then I click the Games link on the navigation bar
  And I should be redirected to the Games page
  
Scenario: Games to Home navigation
  Given I am on the Games page
  Then I click the Home link on the navigation bar
  And I should be redirected to the Home page