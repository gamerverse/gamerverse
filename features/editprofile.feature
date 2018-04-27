Feature: Edit Profile
  
  As an existing user,
  I want to access my profile,
  So that I can edit my information

Background: users have been added to database
  Given the following users exist:
  | username | email           | password   | password_confirmation | zipcode | bio
  | test1    | test1@gmail.com | testing123 | testing123            | 11111   | hello1

  Then 1 seed users should exist

Scenario: Edit all the fields
  Given I am logged in
  Given I am on the Edit Profile page
  And I set Bio to I love games
  And I set Zip Code to 13850
  And I set Email to johndoe@cs445.com
  And I click the Submit button
  Then I should be redirected to the Profile page
  And I should see Bio populated with the text I love games
  And I should see Zip Code populated with the text 13850
  And I should see Email populated with the text johndoe@cs445.com

Scenario: Edit Bio - Happy Path
  Given I am logged in
  Given I am on the Edit Profile page
  And I set Bio to I love games
  And I click the Submit button
  Then I should be redirected to the Profile page
  And I should see Bio populated with the text I love games

Scenario: Edit Email - Happy Path
  Given I am logged in
  Given I am on the Edit Profile page
  And I set Email to johndoe@cs445.com
  And I click the Submit button
  Then I should be redirected to the Profile page
  And I should see Email populated with the text johndoe@cs445.com

Scenario: Edit Email - Sad Path (invalid)
  Given I am logged in
  Given I am on the Edit Profile page
  And I set Email to bademail
  And I click the Submit button
  Then I should be redirected to the Edit Profile page
  Then I should see an error message for Email

Scenario: Edit Email - Sad Path (empty field)
  Given I am logged in
  Given I am on the Edit Profile page
  And I leave Email empty
  And I click the Submit button
  Then I should be redirected to the Edit Profile page
  Then I should see an error message for Email

Scenario: Edit Zip Code - Happy Path
  Given I am logged in
  Given I am on the Edit Profile page
  And I set Zip Code to 13850
  And I click the Submit button
  Then I should be redirected to the Profile page
  And I should see Zip Code populated with the text 13850

Scenario: Edit Zip Code - Sad Path (invalid)
  Given I am logged in
  Given I am on the Edit Profile page
  And I set Zip Code to badzipcode
  And I click the Submit button
  Then I should be redirected to the Edit Profile page
  Then I should see an error message for Zip Code

Scenario: Edit Zip Code - Sad Path (empty field)
  Given I am logged in
  Given I am on the Edit Profile page
  And I leave Zip Code empty
  And I click the Submit button
  Then I should be redirected to the Edit Profile page
  Then I should see an error message for Zip Code