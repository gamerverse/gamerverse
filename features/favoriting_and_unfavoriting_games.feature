Feature: Favoriting and Unfavoriting Games
  
  As a user,
  I want to be able to favorite and unfavorite games
  So that I can customize which games I like
  
Background: games and users have been added to database

  Given the following games exist:
  | title                                 | coverart                            | favorite_count  |
  | Overwatch                             | /assets/covers/overwatch.jpg        | 2               |
  | Hearthstone                           | /assets/covers/hearthstone.jpg      | 2               |
  Then 2 seed games should exist
  
  Given the following users exist:
  | username | email           | password   | password_confirmation | zipcode | bio     |
  | test1    | test1@gmail.com | testing123 | testing123            | 11111   | hello1  |
  Then 1 seed users should exist
  
  Given the following favorite games exist:
  | game_id       | user_id   |
  | 2             | 1         |
  Then 1 seed favorite games should exist
  
Scenario: Favorite a Game
  Given I am logged in
  Given I am on the Home page
  When I click the Favorite button for Overwatch
  Then I should be redirected to the Home page
  And I should see a Featured Games section
  And I should see it populated with 2 games
  And I should see Overwatch before Hearthstone
  And I click the Profile link on the navigation bar
  And I should be redirected to the Profile page
  And I should see a Favorite Games section
  And I should see it populated with 2 games
  
  
Scenario: Unfavoriting a game
  Given I am logged in
  Given I am on the Home page
  When I click the Unfavorite button for Hearthstone
  Then I should be redirected to the Home page
  And I should see a Featured Games section
  And I should see it populated with 2 games
  And I should see Overwatch before Hearthstone
  And I click the Profile link on the navigation bar
  And I should be redirected to the Profile page
  And I should see a Favorite Games section
  And I should see it populated with 0 games