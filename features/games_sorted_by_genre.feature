Feature: Games sorted by genre
  
  As a user,
  I want the games to be sorted by genre
  So that I can find games easier
  
Background: games and users have been added to the database
  
  Given the following games exist:
  | title                                 | coverart                            | genre   |
  | Overwatch                             | /assets/covers/overwatch.jpg        | Shooter |
  | DOOM                                  | /assets/covers/doom.jpg             | Shooter |
  | League of Legends                     | /assets/covers/league_of_legends.jpg| MOBA    |
  | Dota 2                                | /assets/covers/dota_2.jpg           | MOBA    |
  And I am on the Games page
  Then 4 seed games should exist
  
Scenario: Games are shown in the correct genre
  Given I am on the Games page
  Then I should see the MOBA genre
  And I should see the Shooter genre
  And I should see Overwatch in the Shooter genre
  And I should see DOOM in the Shooter genre
  And I should see League of Legends in the MOBA genre
  And I should see Dota 2 in the MOBA genre