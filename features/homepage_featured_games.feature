Feature: Home Page - Featured Games
 
  As a user,
  I want to see a list of featured games,
  So that I can see a possible list of games to play.

Background: games have been added to database

  Given the following games exist:
  | title                   | coverart                                    |
  | League of Legends       | /assets/covers/league_of_legends.jpg        |
  | Overwatch               | /assets/covers/overwatch.jpg                |
  | Super Smash Bros. Melee | /assets/covers/super_smash_bros_melee.jpg   |

  And I am on the Home page
  Then 3 seed games should exist
  
Scenario: featured games are shown on the homepage
  Given I am on the Home page
  Then I should see a Featured Games section
  And I should see it populated with 3 games