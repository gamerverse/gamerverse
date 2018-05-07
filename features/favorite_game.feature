Feature: Favorite Games
  
  As a user,
  I want to be able to favorite a game
  So that I can find other people who play that game
  
Background: games and users have been added to database

  Given the following games exist:
  | title                                 | coverart                            |
  | Overwatch                             | /assets/covers/overwatch.jpg        |
  | Hearthstone                           | /assets/covers/hearthstone.jpg      |
  
  Then 2 seed games should exist
  
  Given the following users exist:
  | username | email           | password   | password_confirmation | zipcode | bio
  | test1    | test1@gmail.com | testing123 | testing123            | 11111   | hello1

  Then 1 seed users should exist
  
  Given the following favorite games exist:
  | game_id       | user_id   |
  | 2             | 1         |
  
  Then 1 seed favorite games should exist
  
Scenario: Favorite a Game
  Given I am logged in
  Given I am on the Games page
  When I click the Favorite button for Overwatch
  Then I should be redirected to the Games page
  And I click the Profile link on the navigation bar
  Then I should see a Favorite Games section
  And I should see it populated with 2 games
  
Scenario: Unfavoriting a game
  Given I am logged in
  Given I am on the Games page
  When I click the Unfavorite button for Hearthstone
  Then I should be redirected to the Games page
  And I click the Profile link on the navigation bar
  Then I should see a Favorite Games section
  And I should see it populated with 0 games