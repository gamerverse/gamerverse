Feature: Favorite Games
  
  As a user,
  I want to be able to favorite a game
  So that I can find other people who play that game
  
Background: games and users have been added to database

  Given the following games exist:
  | title                                 | coverart                                    |
  | League of Legends                     | /assets/covers/league_of_legends.jpg        |
  
  Then 1 seed games should exist
  
  Given the following users exist:
  | username | email           | password   | password_confirmation | zipcode | bio
  | test1    | test1@gmail.com | testing123 | testing123            | 11111   | hello1

  Then 1 seed users should exist
  
Scenario: Favorite a Game
  Given I am logged in
  And I am on the Games Page
  When I click the Favorite button for League of Legends
  Then I should be redirected to the Games Page
  And I click the Profile link on the navigation bar
  And I should see League of Legends in the Favorite Games section
  
Scenario: Favoriting an already favorited game
  Given I am logged in
  And League of Legends is favorited by me
  When I go to the Games Page
  And I click the Favorite button for League of Legends
  Then I should be redirected to the Games Page
  And I should see an error message for Favorite Game
  
Scenario: Unfavoriting a game
  Given I am logged in
  And I am on the Profile Page
  When I click the Unfavorite button for League of Legends
  Then I should be redirected to the Games Page
  And I click the Profile link on the navigation bar
  And I should not see League of Legends in the Favorite Games section