Feature: Navigation Bar v3 (Login)
 
  As a user,
  I want to see a navigation bar on every page,
  So that I can navigate through the website
  
Background: user has been added to database

  Given the following users exist:
  | username | email           | password   | password_confirmation | zipcode | bio
  | test1    | test1@gmail.com | testing123 | testing123            | 11111   | hello1

  Then 1 seed users should exist  
  
Scenario: Navigation when Logged Out
  Given I am logged out
  Then I should see a Register link on the navigation bar
  Then I should see a Login link on the navigation bar
  Then I should not see a Logout link on the navigation bar

Scenario: Navigation when Logged In
  Given I am logged in
  Then I should see a Logout link on the navigation bar
  Then I should not see a Register link on the navigation bar
  Then I should not see a Login link on the navigation bar

Scenario: Register to Login navigation
  Given I am on the Register page
  Then I click the Login link on the navigation bar
  And I should be redirected to the Login page

Scenario: Games to Login navigation
  Given I am on the Games page
  Then I click the Login link on the navigation bar
  And I should be redirected to the Login page

Scenario: Events to Login navigation
  Given I am on the Events page
  Then I click the Login link on the navigation bar
  And I should be redirected to the Login page

Scenario: Home to Login navigation
  Given I am on the Home page
  Then I click the Login link on the navigation bar
  And I should be redirected to the Login page

Scenario: Login to Home navigation
  Given I am on the Login page
  Then I click the Home link on the navigation bar
  And I should be redirected to the Home page

Scenario: Login to Games navigation
  Given I am on the Login page
  Then I click the Games link on the navigation bar
  And I should be redirected to the Games page

Scenario: Login to Events navigation
  Given I am on the Login page
  Then I click the Events link on the navigation bar
  And I should be redirected to the Events page

Scenario: Login to Register navigation
  Given I am on the Login page
  Then I click the Register link on the navigation bar
  And I should be redirected to the Register page