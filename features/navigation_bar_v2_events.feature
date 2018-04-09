Feature: Navigation Bar v2 (Events)

  As a user,
  I want to see a navigation bar on every page,
  So that I can navigate through the website

Scenario: Home to Events navigation
  Given I am on the Home page
  Then I click the Events link on the navigation bar
  And I should be redirected to the Events page

Scenario: Games to Events navigation
  Given I am on the Games page
  Then I click the Events link on the navigation bar
  And I should be redirected to the Events page

Scenario: Events to Home navigation
  Given I am on the Events page
  Then I click the Home link on the navigation bar
  And I should be redirected to the Home page

Scenario: Events to Games navigation
  Given I am on the Events page
  Then I click the Games link on the navigation bar
  And I should be redirected to the Games page