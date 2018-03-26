Feature: Games Page
 
  As a user,
  I want to see a list of all games,
  So that I can see a possible list of games to play.

Background: games have been added to database

  Given the following games exist:
  | title                                 | coverart                                    |
  | League of Legends                     | /assets/covers/league_of_legends.jpg        |
  | Overwatch                             | /assets/covers/overwatch.jpg                |
  | Super Smash Bros. Melee               | /assets/covers/super_smash_bros_melee.jpg   |
  | Fortnite                              | /assets/covers/fortnite.jpg                 |
  | Hearthstone                           | /assets/covers/hearthstone.jpg              |
  | Mario Kart 8                          | /assets/covers/mario_kart_8.jpg             |
  | Starcraft 2                           | /assets/covers/starcraft_2.jpg              |
  | Super Mario 64                        | /assets/covers/super_mario_64.jpg           |
  | Street Fighter V                      | /assets/covers/street_fighter_v.jpg         |
  | The Legend of Zelda: Ocarina of Time  | /assets/covers/zelda_ocarina_of_time.jpg    |

  And I am on the Games page
  Then 10 seed games should exist
  
Scenario: All games are shown on the homepage
  Given I am on the Games page
  Then I should see a Games section
  And I should see it populated with 10 games