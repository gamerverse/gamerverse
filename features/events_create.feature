Feature: Event Creation
  
  As an existing user,
  I want to create an event,
  So that other users can see my event

Background: users have been added to database
  Given the following users exist:
  | username | email           | password   | password_confirmation | zipcode | bio
  | test1    | test1@gmail.com | testing123 | testing123            | 11111   | hello1

  Then 1 seed users should exist


Scenario: Seeing Create Event if logged in
  Given I am logged in
  Given I am on the Events page
  Then I should see a Create Event link
  
Scenario: Not Seeing Create Event if not logged in
  Given I am logged out
  Given I am on the Events page
  Then I should not see a Create Event link
  
Scenario: Creating an Event
  Given I am logged in
  Given I am on the Create Event page
  And I set Title to testtitle
  And I set Location to testlocation
  And I set Description to testdescription
  And I click the Submit button
  Then I should be redirected to the Events page
  And I should see it populated with 1 events
  
Scenario: Creating an Event (Sad Path - Title)
  Given I am logged in
  Given I am on the Create Event page
  And I set Title to nothing
  And I set Location to testlocation
  And I set Description to testdescription
  And I click the Submit button
  Then I should be redirected to the Create Event page
  And I should see an error message for Title
  
Scenario: Creating an Event (Sad Path - Location)
  Given I am logged in
  Given I am on the Create Event page
  And I set Title to testtitle
  And I set Location to nothing
  And I set Description to testdescription
  And I click the Submit button
  Then I should be redirected to the Create Event page
  And I should see an error message for Location
  
Scenario: Creating an Event (Sad Path - Description)
  Given I am logged in
  Given I am on the Create Event page
  And I set Title to testtitle
  And I set Location to testlocation
  And I set Description to nothing
  And I click the Submit button
  Then I should be redirected to the Create Event page
  And I should see an error message for Description
  
