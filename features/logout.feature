Feature: Log Out
  
  As a user,
  I want to be able to log out,
  So that I can be signed out of my account.

Background: user has been added to database

  Given the following users exist:
  | username | email           | password   | password_confirmation | zipcode | bio
  | test1    | test1@gmail.com | testing123 | testing123            | 11111   | hello1

  Then 1 seed users should exist
  
Scenario: User is able to log out
  Given I am logged in
  And I click the Logout link on the navigation bar
  Then I should be logged out
  And I should be redirected to the Home page