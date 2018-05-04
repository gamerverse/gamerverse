Feature: Favorite Events
  
  As a user,
  I want to be able to favorite an event
  So that I can find other people who are going to that event
  
Background: events and users have been added to database

  Given the following events exist:
  | title                            | date                       | location        | description                           |
  | Smash LAN Party                  | DateTime.new(2018,4,8,12)  | Smashville      | LAN party for the best Smash players! |
  
  Then 1 seed events should exist
  
  Given the following users exist:
  | username | email           | password   | password_confirmation | zipcode | bio
  | test1    | test1@gmail.com | testing123 | testing123            | 11111   | hello1

  Then 1 seed users should exist
  
Scenario: Favorite an Event
  Given I am logged in
  And I am on the Events Page
  When I click the Favorite button for Smash LAN Party
  Then I should be redirected to the Events Page
  And I click the Profile link on the navigation bar
  And I should see Smash LAN Party in the Favorite Events section
  
Scenario: Favoriting an already favorited Event
  Given I am logged in
  And Smash LAN Party is favorited by me
  When I go to the Events Page
  And I click the Favorite button for Smash LAN Party
  Then I should be redirected to the Events Page
  And I should see an error message for Favorite Event
  
Scenario: Unfavoriting an event
  Given I am logged in
  And I am on the Profile Page
  When I click the Unfavorite button for Smash LAN Party
  Then I should be redirected to the Events Page
  And I click the Profile link on the navigation bar
  And I should not see Smash LAN Party in the Favorite Events section