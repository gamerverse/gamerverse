Feature: Home Page - Featured Games
 
  As a user,
  I want to see a list of featured games,
  So that I can see a possible list of games to play.

Background: games have been added to database

  Given the following games exist:
  | title                   | coverart                                              |
  | League of Legends       | /app/assets/images/covers/league_of_legends.jpg       |
  | Overwatch               | /app/assets/images/covers/overwatch.jpg               |
  | Super Smash Bros. Melee | /app/assets/images/covers/super_smash_bros_melee.jpg  |

  And I am on the Home page
  Then 3 seed games should exist
  
Scenario: featured games are shown on the homepage, assuming we are not signed in
  Given I am on the Home page
  And I am not signed in
  Then I should see a Featured Games section
  And I should see it populated with a number of games
  
