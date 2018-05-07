Feature: Attend Events
  
  As a user,
  I want to be able to Attend an event
  So that I can find other people who are going to that event
  
Background: events and users have been added to database

  Given the following events exist:
  | title                            | date                       | location        | description                           |
  | Smash LAN Party                  | DateTime.new(2018,4,8,12)  | Smashville      | LAN party for the best Smash players! |
  | Smash LAN Party 2                | DateTime.new(2018,4,8,12)  | Smashville      | LAN party for the best Smash players! |

  Then 2 seed events should exist
  
  Given the following users exist:
  | username | email           | password   | password_confirmation | zipcode | bio
  | test1    | test1@gmail.com | testing123 | testing123            | 11111   | hello1

  Then 1 seed users should exist
  
  Given the following attending events exist:
  | event_id      | user_id   |
  | 2             | 1         |
  
  Then 1 seed attending events should exist
  
Scenario: Attend an Event
  Given I am logged in
  And I am on the Events page
  When I click the Attend button for Smash LAN Party
  Then I should be redirected to the Events page
  And I click the Profile link on the navigation bar
  Then I should see a Events I'm Attending section
  And I should see it populated with 1 event
  
Scenario: Unattending an event
  Given I am logged in
  And I am on the Profile page
  When I click the Unattend button for Smash LAN Party
  Then I should be redirected to the Profile page
  Then I should see a Events I'm Attending section
  And I should see it populated with 0 event