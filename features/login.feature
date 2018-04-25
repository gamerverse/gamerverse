Feature: Log In
  
  As a user,
  I want to be able to log in,
  So that I can be signed in to my account.

Background: user has been added to database

  Given the following users exist:
  | username | email           | password   | password_confirmation | zipcode | bio
  | test1    | test1@gmail.com | testing123 | testing123            | 11111   | hello1

  Then 1 seed users should exist
  
Scenario: User is able to log in
  Given I am on the Login page
  And I set Username to test1
  And I set Password to testing123
  And I click the Submit button
  Then I should be redirected to the Home page
  And I should be logged in
  
Scenario: Invalid Credentials
  Given I am on the Login page
  And I set Username to test1
  And I set Password to no
  And I click the Submit button
  Then I should be redirected to the Login page
  And I should see an error message for Username
  And I should be logged out