Feature: Events Page
 
  As a user,
  I want to see a list of all events,
  So that I can see a possible list of events to play.

Background: events have been added to database

  Given the following events exist:
  | title                            | date                       | location        | description                           |
  | Smash LAN Party                  | DateTime.new(2018,4,8,12)  | Smashville      | LAN party for the best Smash players! |
  | Mario Odyssey Speedrun Marathon  | DateTime.new(2009,9,1,17)  | New Donk City   | goin fast                             |
  | League 1v1                       | DateTime.new(2015,2,22,06) | Summoner's Rift | First Blood or First Tower Wins       |
  | League 2v2                       | DateTime.new(2015,2,23,06) | Summoner's Rift | First Blood x2 Wins       |

  And I am on the Events page
  Then 4 seed events should exist
  
Scenario: All events are shown on the events page
  Given I am on the Events page
  Then I should see a Events section
  And I should see it populated with 4 events