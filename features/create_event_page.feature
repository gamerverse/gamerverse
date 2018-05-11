Feature: Create Event Page
  As a user,
  I want to see a form in order to create an event,
  So more people can learn about it

Background: users have been added to database
  Given the following users exist:
  | username | email           | password   | password_confirmation | zipcode | bio
  | test1    | test1@gmail.com | testing123 | testing123            | 11111   | hello1
  Then 1 seed users should exist

Scenario: Seeing Create Event if logged in
  Given I am logged in
  Given I am on the Events page
  Then I should see a Create Event link
  
Scenario: Not Seeing Create Event if not logged in
  Given I am logged out
  Given I am on the Events page
  Then I should not see a Create Event link

Scenario: Going to Create Event page if logged in
  Given I am logged in
  Given I am on the Events page
  Then I should see a Create Event link
  And I click the Create Event link
  And I should be redirected to the Create Event page