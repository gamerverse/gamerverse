Feature: Attending and Unattending Events
  
  As a user,
  I want to be able to attend and unattend events
  So that I can customize which events I want to go to
  
Background: events and users have been added to database

  Given the following events exist:
  | title                         | date                       | location        | description                           | attending_count |
  | Party1                        | DateTime.new(2018,4,8,12)  | Smashville      | LAN party for the best Smash players! | 2               |
  | Party2                        | DateTime.new(2018,4,8,12)  | Smashville      | LAN party for the best Smash players! | 2               |
  Then 2 seed events should exist
  
  Given the following users exist:
  | username | email           | password   | password_confirmation | zipcode | bio     |
  | test1    | test1@gmail.com | testing123 | testing123            | 11111   | hello1  |
  Then 1 seed users should exist
  
  Given the following attending events exist:
  | event_id      | user_id   |
  | 2             | 1         |
  Then 1 seed attending events should exist
  
Scenario: Attend an Event
  Given I am logged in
  And I am on the Home page
  When I click the Attend button for Party1
  Then I should be redirected to the Home page
  And I should see it populated with 2 events
  And I should see a Featured Events section
  And I should see Party1 before Party2
  And I click the Profile link on the navigation bar
  And I should be redirected to the Profile page
  Then I should see a Events I'm Attending section
  And I should see it populated with 2 event
  
Scenario: Unattending an event
  Given I am logged in
  And I am on the Home page
  When I click the Unattend button for Party2
  Then I should be redirected to the Home page
  And I should see a Featured Events section
  And I should see Party1 before Party2
  And I click the Profile link on the navigation bar
  And I should be redirected to the Profile page
  Then I should see a Events I'm Attending section
  And I should see it populated with 0 event